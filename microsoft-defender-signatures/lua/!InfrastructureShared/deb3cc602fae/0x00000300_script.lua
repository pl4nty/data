-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\deb3cc602fae\0x00000300_luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1, l_0_2 = nil, nil
if (this_sigattrlog[2]).matched and this_sigattrlog[2] ~= nil and this_sigattrlog[2] ~= "" then
  l_0_1 = (string.lower)((this_sigattrlog[2]).utf8p1)
else
  if (this_sigattrlog[3]).matched and this_sigattrlog[3] ~= nil and this_sigattrlog[3] ~= "" then
    l_0_1 = (string.lower)((this_sigattrlog[3]).utf8p1)
  end
end
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
for l_0_6 = 1, l_0_0 do
  if (sigattr_tail[l_0_6]).attribute == 16384 then
    l_0_2 = ((sigattr_tail[l_0_6]).utf8p1):lower()
    if l_0_2 == l_0_1 then
      return mp.CLEAN
    end
  end
end
TrackPidAndTechniqueBM("BM", "T1647", "DefenseEvasion_PlistFileModification")
;
(mp.set_mpattribute)("BM_PlistModification")
return mp.INFECTED

