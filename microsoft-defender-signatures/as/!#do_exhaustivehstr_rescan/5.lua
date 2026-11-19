-- Threat: !#do_exhaustivehstr_rescan
-- Type: 10

if not peattributes.suspicious_timestamp and not peattributes.deep_analysis and not peattributes.dt_error_heur_exit_criteria and not peattributes.suspicious_image_version then
  return mp.CLEAN
end
local l_0_0 = mp.get_mpattribute("HSTR:TrojanSpy:Win32/Rebhip!custom")
local l_0_1 = mp.get_mpattribute("HSTR:TrojanSpy:Win32/Rebhip!rsrc")
local l_0_2 = mp.get_mpattribute("HSTR:TrojanSpy:Win32/Rebhip!exhaustive")
if l_0_0 or l_0_1 or l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
