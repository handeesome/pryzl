import 'package:flutter_svg/flutter_svg.dart';

class PryzSecurityIcons {
  PryzSecurityIcons._();

  static const _keyPath = 'assets/icons/security/key.svg';
  static const _keyNoPath = 'assets/icons/security/key-no.svg';
  static const _lockPath = 'assets/icons/security/lock.svg';
  static const _lockCirclePath = 'assets/icons/security/lock-circle.svg';
  static const _lockNoPath = 'assets/icons/security/lock-no.svg';
  static const _shieldPath = 'assets/icons/security/shield.svg';
  static const _shieldLockPath = 'assets/icons/security/shield-lock.svg';
  static const _shieldNoPath = 'assets/icons/security/shield-no.svg';
  static const _shieldOkPath = 'assets/icons/security/shield-ok.svg';
  static const _unlockPath = 'assets/icons/security/unlock.svg';
  static const _verifiedPath = 'assets/icons/security/verified.svg';

  static final key = SvgPicture.asset(_keyPath);
  static final keyNo = SvgPicture.asset(_keyNoPath);
  static final lock = SvgPicture.asset(_lockPath);
  static final lockCircle = SvgPicture.asset(_lockCirclePath);
  static final lockNo = SvgPicture.asset(_lockNoPath);
  static final shield = SvgPicture.asset(_shieldPath);
  static final shieldLock = SvgPicture.asset(_shieldLockPath);
  static final shieldNo = SvgPicture.asset(_shieldNoPath);
  static final shieldOk = SvgPicture.asset(_shieldOkPath);
  static final unlock = SvgPicture.asset(_unlockPath);
  static final verified = SvgPicture.asset(_verifiedPath);
}
