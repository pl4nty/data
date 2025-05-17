-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1f1b345898ccd\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
local l_0_1 = {}
l_0_1["73a99e52-c380-4b86-9d47-fe1cb231f222"] = true
l_0_1["9d61afa0-cfa4-4746-95af-dc897a6f6774"] = true
l_0_1["8a2d9a03-1cd7-4b6a-9e63-6fb98b8c0e7a"] = true
l_0_1["24d4a9cf-e7f1-400a-b2d4-bd534e1e168d"] = true
l_0_1["a38396bc-49a9-4d9e-95a7-a7fdc4cdd463"] = true
if l_0_0 == nil or l_0_1[l_0_0] == nil then
  return mp.CLEAN
end
local l_0_2, l_0_3 = nil, nil
if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p1 ~= nil and (this_sigattrlog[8]).utf8p2 ~= nil then
  l_0_2 = (this_sigattrlog[8]).utf8p1
  l_0_3 = (string.lower)((this_sigattrlog[8]).utf8p2)
end
if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil and (this_sigattrlog[9]).utf8p2 ~= nil then
  l_0_2 = (this_sigattrlog[9]).utf8p1
  l_0_3 = (string.lower)((this_sigattrlog[9]).utf8p2)
end
if l_0_2 == nil or l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4, l_0_5 = l_0_2:match("(%d+):(%d+)")
if l_0_4 == nil or l_0_5 == nil then
  return mp.CLEAN
end
if type(l_0_5) ~= "number" then
  l_0_5 = tonumber(l_0_5)
end
if type(l_0_4) ~= "number" then
  l_0_4 = tonumber(l_0_4)
end
do
  if (l_0_5 == 16 or l_0_5 == 32 or l_0_5 == 64 or l_0_5 == 128) and l_0_5 ~= l_0_4 then
    local l_0_6 = GetSuspiciousAllocsInBmLog()
    if not l_0_6 then
      return mp.CLEAN
    end
    for l_0_10 in pairs(l_0_6) do
      TriggerTargetedMemoryScan(l_0_10)
      AddSuspiciousRegion(l_0_10)
    end
    TrackPidAndTechniqueBM("BM", "T1620", "reflective_code_loading")
    return mp.INFECTED
  end
  return mp.CLEAN
end

