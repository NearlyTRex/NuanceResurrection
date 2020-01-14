; Listing generated by Microsoft (R) Optimizing Compiler Version 14.00.50727.762 

	TITLE	c:\NuanceExperimental\TestConditionCode.cpp
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMTD
INCLUDELIB OLDNAMES

PUBLIC	?TestConditionCode@MPE@@QAE_NI@Z		; MPE::TestConditionCode
EXTRN	__RTC_Shutdown:PROC
EXTRN	__RTC_InitBase:PROC
;	COMDAT rtc$TMZ
; File c:\nuanceexperimental\testconditioncode.cpp
rtc$TMZ	SEGMENT
__RTC_Shutdown.rtc$TMZ DD FLAT:__RTC_Shutdown
rtc$TMZ	ENDS
;	COMDAT rtc$IMZ
rtc$IMZ	SEGMENT
__RTC_InitBase.rtc$IMZ DD FLAT:__RTC_InitBase
; Function compile flags: /Odtp /RTCsu
rtc$IMZ	ENDS
_TEXT	SEGMENT
tv201 = -24						; size = 4
tv184 = -20						; size = 4
tv163 = -16						; size = 4
tv138 = -12						; size = 4
tv65 = -8						; size = 4
_this$ = -4						; size = 4
_whichCondition$ = 8					; size = 4
?TestConditionCode@MPE@@QAE_NI@Z PROC			; MPE::TestConditionCode
; _this$ = ecx

; 4    : {

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	eax, -858993460				; ccccccccH
	mov	DWORD PTR [ebp-24], eax
	mov	DWORD PTR [ebp-20], eax
	mov	DWORD PTR [ebp-16], eax
	mov	DWORD PTR [ebp-12], eax
	mov	DWORD PTR [ebp-8], eax
	mov	DWORD PTR [ebp-4], eax
	mov	DWORD PTR _this$[ebp], ecx

; 5    :   //This sequencing is correct for 32/64 bit ECU instructions.  The decode
; 6    :   //handler for 16/48 bit ECU instructions converts the extracted condition
; 7    :   //to this sequence.  VMLabs must die.  Mission accomplished!
; 8    : 
; 9    :   switch(whichCondition & 0x1FUL)

	mov	eax, DWORD PTR _whichCondition$[ebp]
	and	eax, 31					; 0000001fH
	mov	DWORD PTR tv65[ebp], eax
	cmp	DWORD PTR tv65[ebp], 31			; 0000001fH
	ja	$LN33@TestCondit
	mov	ecx, DWORD PTR tv65[ebp]
	jmp	DWORD PTR $LN45@TestCondit[ecx*4]
$LN32@TestCondit:

; 10   :   {
; 11   :     case 0:
; 12   :       //ne
; 13   :       return (tempCC & CC_ALU_ZERO) == 0;

	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+320]
	and	eax, 1
	neg	eax
	sbb	eax, eax
	add	eax, 1
	jmp	$LN35@TestCondit
$LN31@TestCondit:

; 14   :     case 1:
; 15   :       //c0z
; 16   :       return (tempCC & CC_COUNTER0_ZERO);

	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+320]
	and	ecx, 32					; 00000020H
	setne	al
	jmp	$LN35@TestCondit
$LN30@TestCondit:

; 17   :     case 2:
; 18   :       //c1z
; 19   :       return (tempCC & CC_COUNTER1_ZERO);

	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+320]
	and	eax, 64					; 00000040H
	setne	al
	jmp	$LN35@TestCondit
$LN29@TestCondit:

; 20   :     case 3:
; 21   :       //cc
; 22   :       return (tempCC & CC_ALU_CARRY) == 0;

	mov	ecx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [ecx+320]
	and	eax, 2
	neg	eax
	sbb	eax, eax
	add	eax, 1
	jmp	$LN35@TestCondit
$LN28@TestCondit:

; 23   :     case 4:
; 24   :       //eq
; 25   :       return (tempCC & CC_ALU_ZERO);

	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+320]
	and	eax, 1
	jmp	$LN35@TestCondit
$LN27@TestCondit:

; 26   :     case 5:
; 27   :       //cs
; 28   :       return (tempCC & CC_ALU_CARRY);

	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+320]
	and	ecx, 2
	setne	al
	jmp	$LN35@TestCondit
$LN26@TestCondit:

; 29   :     case 6:
; 30   :       //vc
; 31   :       return (tempCC & CC_ALU_OVERFLOW) == 0;

	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+320]
	and	eax, 4
	neg	eax
	sbb	eax, eax
	add	eax, 1
	jmp	$LN35@TestCondit
$LN25@TestCondit:

; 32   :     case 7:
; 33   :       //vs
; 34   :       return (tempCC & CC_ALU_OVERFLOW);

	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+320]
	and	ecx, 4
	setne	al
	jmp	$LN35@TestCondit
$LN24@TestCondit:

; 35   :     case 8:
; 36   :       //lt
; 37   :       return ((tempCC & (CC_ALU_NEGATIVE | CC_ALU_OVERFLOW)) == CC_ALU_NEGATIVE) ||
; 38   :         ((tempCC & (CC_ALU_NEGATIVE | CC_ALU_OVERFLOW)) == CC_ALU_OVERFLOW);

	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+320]
	and	eax, 12					; 0000000cH
	cmp	eax, 8
	je	SHORT $LN37@TestCondit
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+320]
	and	edx, 12					; 0000000cH
	cmp	edx, 4
	je	SHORT $LN37@TestCondit
	mov	DWORD PTR tv138[ebp], 0
	jmp	SHORT $LN38@TestCondit
$LN37@TestCondit:
	mov	DWORD PTR tv138[ebp], 1
$LN38@TestCondit:
	mov	al, BYTE PTR tv138[ebp]
	jmp	$LN35@TestCondit
$LN23@TestCondit:

; 39   :     case 9:
; 40   :       //mvc
; 41   :       return (tempCC & CC_MUL_OVERFLOW) == 0;

	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+320]
	and	eax, 16					; 00000010H
	neg	eax
	sbb	eax, eax
	add	eax, 1
	jmp	$LN35@TestCondit
$LN22@TestCondit:

; 42   :     case 10:
; 43   :       //mvs
; 44   :       return (tempCC & CC_MUL_OVERFLOW);

	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+320]
	and	edx, 16					; 00000010H
	setne	al
	jmp	$LN35@TestCondit
$LN21@TestCondit:

; 45   :     case 11:
; 46   :       //hi
; 47   :       return (tempCC & (CC_ALU_CARRY | CC_ALU_ZERO)) == 0;

	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+320]
	and	eax, 3
	neg	eax
	sbb	eax, eax
	add	eax, 1
	jmp	$LN35@TestCondit
$LN20@TestCondit:

; 48   :     case 12:
; 49   :       //le
; 50   :       return (tempCC & CC_ALU_ZERO) || ((tempCC & (CC_ALU_NEGATIVE | CC_ALU_OVERFLOW)) == CC_ALU_NEGATIVE) ||
; 51   :         ((tempCC & (CC_ALU_NEGATIVE | CC_ALU_OVERFLOW)) == CC_ALU_OVERFLOW);

	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+320]
	and	edx, 1
	jne	SHORT $LN39@TestCondit
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+320]
	and	ecx, 12					; 0000000cH
	cmp	ecx, 8
	je	SHORT $LN39@TestCondit
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+320]
	and	eax, 12					; 0000000cH
	cmp	eax, 4
	je	SHORT $LN39@TestCondit
	mov	DWORD PTR tv163[ebp], 0
	jmp	SHORT $LN40@TestCondit
$LN39@TestCondit:
	mov	DWORD PTR tv163[ebp], 1
$LN40@TestCondit:
	mov	al, BYTE PTR tv163[ebp]
	jmp	$LN35@TestCondit
$LN19@TestCondit:

; 52   :     case 13:
; 53   :       //ls
; 54   :       return (tempCC & (CC_ALU_CARRY | CC_ALU_ZERO));

	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+320]
	and	edx, 3
	setne	al
	jmp	$LN35@TestCondit
$LN18@TestCondit:

; 55   :     case 14:
; 56   :       //pl
; 57   :       return (tempCC & CC_ALU_NEGATIVE) == 0;

	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+320]
	and	eax, 8
	neg	eax
	sbb	eax, eax
	add	eax, 1
	jmp	$LN35@TestCondit
$LN17@TestCondit:

; 58   :     case 15:
; 59   :       //mi
; 60   :       return (tempCC & CC_ALU_NEGATIVE);

	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+320]
	and	edx, 8
	setne	al
	jmp	$LN35@TestCondit
$LN16@TestCondit:

; 61   :     case 16:
; 62   :       //gt
; 63   :       return ((tempCC & (CC_ALU_NEGATIVE | CC_ALU_OVERFLOW | CC_ALU_ZERO)) == (CC_ALU_NEGATIVE | CC_ALU_OVERFLOW)) ||
; 64   :         ((tempCC & (CC_ALU_NEGATIVE | CC_ALU_OVERFLOW | CC_ALU_ZERO)) == 0);

	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+320]
	and	ecx, 13					; 0000000dH
	cmp	ecx, 12					; 0000000cH
	je	SHORT $LN41@TestCondit
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+320]
	and	eax, 13					; 0000000dH
	je	SHORT $LN41@TestCondit
	mov	DWORD PTR tv184[ebp], 0
	jmp	SHORT $LN42@TestCondit
$LN41@TestCondit:
	mov	DWORD PTR tv184[ebp], 1
$LN42@TestCondit:
	mov	al, BYTE PTR tv184[ebp]
	jmp	$LN35@TestCondit
$LN15@TestCondit:

; 65   :     case 17:
; 66   :       //always
; 67   :       return true;

	mov	al, 1
	jmp	$LN35@TestCondit
$LN14@TestCondit:

; 68   :     case 18:
; 69   :       //modmi
; 70   :       return (tempCC & CC_MODMI);

	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+320]
	and	edx, 256				; 00000100H
	setne	al
	jmp	$LN35@TestCondit
$LN13@TestCondit:

; 71   :     case 19:
; 72   :       //modpl
; 73   :       return (tempCC & CC_MODMI) == 0;

	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+320]
	and	eax, 256				; 00000100H
	neg	eax
	sbb	eax, eax
	add	eax, 1
	jmp	$LN35@TestCondit
$LN12@TestCondit:

; 74   :     case 20:
; 75   :       //ge
; 76   :       return ((tempCC & (CC_ALU_NEGATIVE | CC_ALU_OVERFLOW)) == (CC_ALU_NEGATIVE | CC_ALU_OVERFLOW)) ||
; 77   :         ((tempCC & (CC_ALU_NEGATIVE | CC_ALU_OVERFLOW)) == 0);

	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+320]
	and	edx, 12					; 0000000cH
	cmp	edx, 12					; 0000000cH
	je	SHORT $LN43@TestCondit
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+320]
	and	ecx, 12					; 0000000cH
	je	SHORT $LN43@TestCondit
	mov	DWORD PTR tv201[ebp], 0
	jmp	SHORT $LN44@TestCondit
$LN43@TestCondit:
	mov	DWORD PTR tv201[ebp], 1
$LN44@TestCondit:
	mov	al, BYTE PTR tv201[ebp]
	jmp	$LN35@TestCondit
$LN11@TestCondit:

; 78   :     case 21:
; 79   :       //modge
; 80   :       return (tempCC & CC_MODGE);

	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+320]
	and	eax, 128				; 00000080H
	setne	al
	jmp	$LN35@TestCondit
$LN10@TestCondit:

; 81   :     case 22:
; 82   :       //modlt
; 83   :       return (tempCC & CC_MODGE) == 0;

	mov	ecx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [ecx+320]
	and	eax, 128				; 00000080H
	neg	eax
	sbb	eax, eax
	add	eax, 1
	jmp	$LN35@TestCondit
$LN9@TestCondit:

; 84   :     case 23:
; 85   :       //never
; 86   :       return false;

	xor	al, al
	jmp	$LN35@TestCondit
$LN8@TestCondit:

; 87   :     case 24:
; 88   :       //c0ne
; 89   :       return (tempCC & CC_COUNTER0_ZERO) == 0;

	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+320]
	and	eax, 32					; 00000020H
	neg	eax
	sbb	eax, eax
	add	eax, 1
	jmp	SHORT $LN35@TestCondit
$LN7@TestCondit:

; 90   :     case 25:
; 91   :       //never
; 92   :       return false;

	xor	al, al
	jmp	SHORT $LN35@TestCondit
$LN6@TestCondit:

; 93   :     case 26:
; 94   :       //never
; 95   :       return false;

	xor	al, al
	jmp	SHORT $LN35@TestCondit
$LN5@TestCondit:

; 96   :     case 27:
; 97   :       //cf0lo
; 98   :       return (tempCC & CC_COPROCESSOR0) == 0;

	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+320]
	and	eax, 512				; 00000200H
	neg	eax
	sbb	eax, eax
	add	eax, 1
	jmp	SHORT $LN35@TestCondit
$LN4@TestCondit:

; 99   :     case 28:
; 100  :       //c1ne
; 101  :       return (tempCC & CC_COUNTER1_ZERO) == 0;

	mov	ecx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [ecx+320]
	and	eax, 64					; 00000040H
	neg	eax
	sbb	eax, eax
	add	eax, 1
	jmp	SHORT $LN35@TestCondit
$LN3@TestCondit:

; 102  :     case 29:
; 103  :       //cf0hi
; 104  :       return (tempCC & CC_COPROCESSOR0);

	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+320]
	and	eax, 512				; 00000200H
	setne	al
	jmp	SHORT $LN35@TestCondit
$LN2@TestCondit:

; 105  :     case 30:
; 106  :       //cf1lo
; 107  :       return (tempCC & CC_COPROCESSOR1) == 0;

	mov	ecx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [ecx+320]
	and	eax, 1024				; 00000400H
	neg	eax
	sbb	eax, eax
	add	eax, 1
	jmp	SHORT $LN35@TestCondit
$LN1@TestCondit:

; 108  :     case 31:
; 109  :       //cf1hi
; 110  :       return (tempCC & CC_COPROCESSOR1);

	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+320]
	and	eax, 1024				; 00000400H
	setne	al
	jmp	SHORT $LN35@TestCondit
$LN33@TestCondit:

; 111  :   }
; 112  : 
; 113  :   return false;

	xor	al, al
$LN35@TestCondit:

; 114  : }

	mov	esp, ebp
	pop	ebp
	ret	4
	npad	1
$LN45@TestCondit:
	DD	$LN32@TestCondit
	DD	$LN31@TestCondit
	DD	$LN30@TestCondit
	DD	$LN29@TestCondit
	DD	$LN28@TestCondit
	DD	$LN27@TestCondit
	DD	$LN26@TestCondit
	DD	$LN25@TestCondit
	DD	$LN24@TestCondit
	DD	$LN23@TestCondit
	DD	$LN22@TestCondit
	DD	$LN21@TestCondit
	DD	$LN20@TestCondit
	DD	$LN19@TestCondit
	DD	$LN18@TestCondit
	DD	$LN17@TestCondit
	DD	$LN16@TestCondit
	DD	$LN15@TestCondit
	DD	$LN14@TestCondit
	DD	$LN13@TestCondit
	DD	$LN12@TestCondit
	DD	$LN11@TestCondit
	DD	$LN10@TestCondit
	DD	$LN9@TestCondit
	DD	$LN8@TestCondit
	DD	$LN7@TestCondit
	DD	$LN6@TestCondit
	DD	$LN5@TestCondit
	DD	$LN4@TestCondit
	DD	$LN3@TestCondit
	DD	$LN2@TestCondit
	DD	$LN1@TestCondit
?TestConditionCode@MPE@@QAE_NI@Z ENDP			; MPE::TestConditionCode
_TEXT	ENDS
END
