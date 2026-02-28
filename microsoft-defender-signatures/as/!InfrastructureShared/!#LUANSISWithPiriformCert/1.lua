local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "MpIsExhaustiveScriptScan"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.UfsSetMetadataBool
L1_1 = "LUAUFS:NSISHasPiriformCert"
L2_1 = true
L0_1(L1_1, L2_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
