-- Threat: !InfrastructureShared
-- Name: Ransom:
-- Type: 17

MpCommon.SetGlobalMpAttribute("RansomAsepCloudRegKeyScan")
MpDetection.ScanResource("ntrunkey://")
MpDetection.ScanResource("runkey://")
MpDetection.ScanResource("runonce://")
MpDetection.ScanResource("runonceex://")
MpCommon.DeleteGlobalMpAttribute("RansomAsepCloudRegKeyScan")
