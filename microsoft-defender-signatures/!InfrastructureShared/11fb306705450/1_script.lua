-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\11fb306705450\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil and (this_sigattrlog[3]).utf8p1 ~= "" then
  l_0_0 = (string.lower)((this_sigattrlog[3]).utf8p1)
else
  if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil and (this_sigattrlog[4]).utf8p1 ~= "" then
    l_0_0 = (string.lower)((this_sigattrlog[4]).utf8p1)
  else
    if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil and (this_sigattrlog[5]).utf8p1 ~= "" then
      l_0_0 = (string.lower)((this_sigattrlog[5]).utf8p1)
    end
  end
end
if l_0_0 ~= "" and ((string.find)(l_0_0, "/users/shared/", 1, true) == 1 or (string.find)(l_0_0, "/library/metadata/", 1, true) == 1 or (string.find)(l_0_0, "/private/var/db/diagnostics", 1, true) == 1) then
  (mp.set_mpattribute)("BM_FileDeletion")
  TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_DeleteFileInterpreter")
  return mp.INFECTED
end
return mp.CLEAN

