/*_ ismbcl0.c						*/
/* Copyright (C) 1995 by Digital Mars		*/
/* All Rights Reserved					*/

#ifdef _MBCS

#include <mbctype.h>
#include <mbstring.h>
#include <setmbcp.h>

int __cdecl _ismbcl0 (unsigned int ch) {
  if (__mbcodepage == _KANJI_CP) {
    if (_ismbblead (ch >> 8) && _ismbbtrail ((unsigned char) ch)) {
      return ch < 0x889F;
    }
  }
  return FALSE;
}

#endif

