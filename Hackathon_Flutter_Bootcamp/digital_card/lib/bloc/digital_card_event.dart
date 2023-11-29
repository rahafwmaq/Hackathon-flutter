abstract class DigitalCardEvent {}

final class GetDigitalCardInfoEvent extends DigitalCardEvent {
  final String email;
  final String password;

  GetDigitalCardInfoEvent(
     this.email, this.password,
  );
}
