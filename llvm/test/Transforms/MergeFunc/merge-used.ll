; RUN: opt -S -mergefunc < %s | FileCheck %s

@llvm.compiler.used = appending global [1 x i8*] [i8* bitcast (i32 (i32)* @a to i8*)], section "llvm.metadata"

; CHECK: @a
; CHECK: @b

define internal i32 @a(i32 %a) unnamed_addr {
  %b = xor i32 %a, 0
  %c = xor i32 %b, 0
  ret i32 %c
}

define i32 @b(i32 %a) unnamed_addr {
  %b = xor i32 %a, 0
  %c = xor i32 %b, 0
  ret i32 %c
}
