-- Threat: !InfrastructureShared
-- Name: !#ALF:TrojanDownloader:Win32/Ruapt.A!dha
-- Type: 13
-- MpAttributes: RPF:DocTemplateBeaconing.A

if mp.getfilesize() == 42496 then
  return mp.INFECTED
end
return mp.CLEAN
