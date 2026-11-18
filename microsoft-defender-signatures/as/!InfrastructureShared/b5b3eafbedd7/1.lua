-- Threat: !InfrastructureShared
-- Name: b5b3eafbedd7
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
end
if this_sigattrlog[5].matched then
  l_0_1 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched then
  l_0_1 = this_sigattrlog[6].utf8p2
elseif this_sigattrlog[7].matched then
  l_0_1 = this_sigattrlog[7].utf8p2
end
if l_0_0 ~= nil and l_0_1 ~= nil then
  local l_0_2 = l_0_1:match("+x [\"]*([^\"]+)")
  if l_0_2 == nil or l_0_2 == "" then
    l_0_2 = l_0_1:match("777 [\"]*([^\"]+)")
  end
  if l_0_2 == nil or l_0_2 == "" then
    l_0_2 = l_0_1:match("755 [\"]*([^\"]+)")
  end
  if l_0_2 ~= nil and l_0_2 ~= "" and string.find(l_0_0, l_0_2, 1, true) then
    TrackPidAndTechniqueBM("BM", "T1222.002", "DefenseEvasion_FileAndDirectoryPermissionsModification_Curl")
    local l_0_3 = this_sigattrlog[4].ppid
    if l_0_3 then
      MpCommon.BmTriggerSig(l_0_3, "BM_C2CurlChmodFile", l_0_2)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
