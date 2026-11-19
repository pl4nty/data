-- Threat: !InfrastructureShared
-- Name: 317b3972e203b
-- Type: 21

local l_0_0 = "DoplikM"
local l_0_1
local l_0_2 = 300
if this_sigattrlog[1].matched then
  l_0_1 = "A"
elseif this_sigattrlog[2].matched then
  l_0_1 = "B"
elseif this_sigattrlog[3].matched then
  l_0_1 = "C"
elseif this_sigattrlog[4].matched then
  l_0_1 = "D"
elseif this_sigattrlog[5].matched then
  l_0_1 = "E"
elseif this_sigattrlog[6].matched then
  l_0_1 = "F"
elseif this_sigattrlog[7].matched then
  l_0_1 = "G"
elseif this_sigattrlog[8].matched then
  l_0_1 = "H"
elseif this_sigattrlog[9].matched then
  l_0_1 = "I"
elseif this_sigattrlog[10].matched then
  l_0_1 = "J"
elseif this_sigattrlog[11].matched then
  l_0_1 = "K"
elseif this_sigattrlog[12].matched then
  l_0_1 = "L"
end
local l_0_3 = MpCommon.QueryPersistContextNoPath(l_0_0, l_0_1)
if not l_0_3 then
  MpCommon.AppendPersistContextNoPath(l_0_0, l_0_1, l_0_2)
end
if 4 <= MpCommon.GetPersistContextCountNoPath(l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
