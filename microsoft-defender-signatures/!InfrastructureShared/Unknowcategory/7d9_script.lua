-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7d9_luac 

-- params : ...
-- function num : 0
Infrastructure_AnomalyTableTelemetry = function()
  -- function num : 0_0
  (MpCommon.SetGlobalMpAttribute)("AnomalyTableTelemetry")
  ;
  (MpDetection.ScanResource)("regkeyvalue://HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Spynet\\\\SpyNetReporting")
  ;
  (MpCommon.DeleteGlobalMpAttribute)("AnomalyTableTelemetry")
end


