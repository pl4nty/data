-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\77f_353.luac 

-- params : ...
-- function num : 0
(MpCommon.SetGlobalMpAttribute)("RansomAsepCloudRegKeyScan")
;
(MpDetection.ScanResource)("ntrunkey://")
;
(MpDetection.ScanResource)("runkey://")
;
(MpDetection.ScanResource)("runonce://")
;
(MpDetection.ScanResource)("runonceex://")
;
(MpCommon.DeleteGlobalMpAttribute)("RansomAsepCloudRegKeyScan")

