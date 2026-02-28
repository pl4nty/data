local L0_1, L1_1, L2_1, L3_1
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1048"
L3_1 = "Exfiltration_ExfiltrationOverAlternativeProtocol_AsymmetricEncryptedNonC2Protocol"
L0_1(L1_1, L2_1, L3_1)
L0_1 = bm
L0_1 = L0_1.trigger_sig
L1_1 = "BM_FileUploadOverUsingSCP"
L2_1 = "Detected"
L0_1(L1_1, L2_1)
L0_1 = addRelatedProcess
L0_1()
L0_1 = reportRelatedBmHits
L0_1()
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
