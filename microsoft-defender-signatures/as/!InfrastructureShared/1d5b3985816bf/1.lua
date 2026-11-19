-- Threat: !InfrastructureShared
-- Name: 1d5b3985816bf
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_2 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_2 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_2 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_2 = this_sigattrlog[6].utf8p2
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  l_0_2 = this_sigattrlog[7].utf8p2
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  l_0_2 = this_sigattrlog[8].utf8p2
end
if l_0_2 then
  if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil and this_sigattrlog[9].utf8p2 ~= nil then
    l_0_0 = this_sigattrlog[9].utf8p1
    l_0_1 = this_sigattrlog[9].utf8p2
  end
  if l_0_0 and l_0_1 then
    local l_0_3 = string.match(l_0_0, "/.+/")
    if l_0_3 and string.find(l_0_2, l_0_3, 1, true) and isTainted(l_0_1, "remote_file_created_taint") then
      taint(l_0_0, "remote_file_created_taint", 3600)
      TrackPidAndTechniqueBM("BM", "T1105", "CommandandControl_IngressToolTransfer_mt2023")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
