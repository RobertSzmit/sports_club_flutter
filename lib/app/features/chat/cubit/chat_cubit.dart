import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports_club_flutter/app/models/chat_item_model.dart';
import 'package:sports_club_flutter/app/repositories/chat_repository.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._chatRepository)
      : super(
          const ChatState(
            messages: [],
            isLoading: false,
            errorMessage: '',
          ),
        );

  final ChatRepository _chatRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const ChatState(
        messages: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription =
        _chatRepository.streamChatMessages().listen((chatItems) {
      emit(
        ChatState(
          messages: chatItems,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
          ..onError((error) {
            emit(
              ChatState(
                messages: const [],
                isLoading: false,
                errorMessage: error.toString(),
              ),
            );
          });
  }

  Future<void> sendMessage(String message) async {
    if (message.isNotEmpty) {
      try {
        await _chatRepository.sendMessage(message);
      } catch (e) {
        emit(
          ChatState(
            messages: state.messages,
            isLoading: false,
            errorMessage: 'Nie udało się wysłać wiadomości: ${e.toString()}',
          ),
        );
      }
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
