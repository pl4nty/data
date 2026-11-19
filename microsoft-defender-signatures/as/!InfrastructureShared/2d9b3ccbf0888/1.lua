-- Threat: !InfrastructureShared
-- Name: 2d9b3ccbf0888
-- Type: 21

local l_0_0, l_0_1
local l_0_2 = {}
local l_0_3 = 0
local l_0_4 = 0
local l_0_5 = {
  [".tmp"] = true,
  [".exe"] = true,
  [".dll"] = true,
  [".ini"] = true,
  [".dat"] = true,
  [".log"] = true,
  [".reg"] = true,
  [".evtx"] = true,
  [".bat"] = true,
  [".zip"] = true,
  [".rar"] = true,
  [".manifest"] = true,
  [".clb"] = true,
  [".ccx"] = true,
  [".cch"] = true
}
local l_0_6 = {
  "rpro8.exe",
  "venturi.serverservice.exe",
  "wdbackup.exe",
  "zenworkswindowsservice.exe",
  "zesservice.exe"
}
local l_0_7 = bm.get_imagepath()
if l_0_7 ~= nil then
  l_0_7 = string.lower(l_0_7)
  if string.find(l_0_7, "\\windows\\", 1, true) ~= nil or string.find(l_0_7, "\\program files", 1, true) ~= nil or string.find(l_0_7, "%program_files%", 1, true) ~= nil then
    return mp.CLEAN
  end
  for l_0_8, l_0_9 in ipairs(l_0_6) do
    if string.find(l_0_7, l_0_9, 1, true) ~= nil then
      return mp.CLEAN
    end
  end
end
if (this_sigattrlog[1].matched and this_sigattrlog[3].matched and this_sigattrlog[5].matched and this_sigattrlog[7].matched and this_sigattrlog[9].matched and this_sigattrlog[11].matched and this_sigattrlog[13].matched and this_sigattrlog[15].matched and this_sigattrlog[17].matched and this_sigattrlog[19].matched and this_sigattrlog[21].matched and this_sigattrlog[23].matched and this_sigattrlog[25].matched and this_sigattrlog[27].matched and this_sigattrlog[29].matched) == false then
  return mp.CLEAN
end
if bm.GetSignatureMatchDuration() > 50000000 then
  return mp.CLEAN
end
if this_sigattrlog[1].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  l_0_1 = string.match(l_0_0, "(%.[^%.]+)$")
  if l_0_1 == ".exe" then
    l_0_4 = l_0_4 + 1
  elseif l_0_1 ~= nil and l_0_2[l_0_1] == nil and l_0_5[l_0_1] == nil then
    l_0_2[l_0_1] = true
    l_0_3 = l_0_3 + 1
  end
end
if this_sigattrlog[3].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
  l_0_1 = string.match(l_0_0, "(%.[^%.]+)$")
  if l_0_1 == ".exe" then
    l_0_4 = l_0_4 + 1
  elseif l_0_1 ~= nil and l_0_2[l_0_1] == nil and l_0_5[l_0_1] == nil then
    l_0_2[l_0_1] = true
    l_0_3 = l_0_3 + 1
  end
end
if this_sigattrlog[5].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
  l_0_1 = string.match(l_0_0, "(%.[^%.]+)$")
  if l_0_1 == ".exe" then
    l_0_4 = l_0_4 + 1
  elseif l_0_1 ~= nil and l_0_2[l_0_1] == nil and l_0_5[l_0_1] == nil then
    l_0_2[l_0_1] = true
    l_0_3 = l_0_3 + 1
  end
end
if this_sigattrlog[7].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[7].utf8p2)
  l_0_1 = string.match(l_0_0, "(%.[^%.]+)$")
  if l_0_1 == ".exe" then
    l_0_4 = l_0_4 + 1
  elseif l_0_1 ~= nil and l_0_2[l_0_1] == nil and l_0_5[l_0_1] == nil then
    l_0_2[l_0_1] = true
    l_0_3 = l_0_3 + 1
  end
end
if this_sigattrlog[9].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[9].utf8p2)
  l_0_1 = string.match(l_0_0, "(%.[^%.]+)$")
  if l_0_1 == ".exe" then
    l_0_4 = l_0_4 + 1
  elseif l_0_1 ~= nil and l_0_2[l_0_1] == nil and l_0_5[l_0_1] == nil then
    l_0_2[l_0_1] = true
    l_0_3 = l_0_3 + 1
  end
end
if this_sigattrlog[11].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[11].utf8p2)
  l_0_1 = string.match(l_0_0, "(%.[^%.]+)$")
  if l_0_1 == ".exe" then
    l_0_4 = l_0_4 + 1
  elseif l_0_1 ~= nil and l_0_2[l_0_1] == nil and l_0_5[l_0_1] == nil then
    l_0_2[l_0_1] = true
    l_0_3 = l_0_3 + 1
  end
end
if this_sigattrlog[13].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[13].utf8p2)
  l_0_1 = string.match(l_0_0, "(%.[^%.]+)$")
  if l_0_1 == ".exe" then
    l_0_4 = l_0_4 + 1
  elseif l_0_1 ~= nil and l_0_2[l_0_1] == nil and l_0_5[l_0_1] == nil then
    l_0_2[l_0_1] = true
    l_0_3 = l_0_3 + 1
  end
end
if this_sigattrlog[15].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[15].utf8p2)
  l_0_1 = string.match(l_0_0, "(%.[^%.]+)$")
  if l_0_1 == ".exe" then
    l_0_4 = l_0_4 + 1
  elseif l_0_1 ~= nil and l_0_2[l_0_1] == nil and l_0_5[l_0_1] == nil then
    l_0_2[l_0_1] = true
    l_0_3 = l_0_3 + 1
  end
end
if this_sigattrlog[17].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[17].utf8p2)
  l_0_1 = string.match(l_0_0, "(%.[^%.]+)$")
  if l_0_1 == ".exe" then
    l_0_4 = l_0_4 + 1
  elseif l_0_1 ~= nil and l_0_2[l_0_1] == nil and l_0_5[l_0_1] == nil then
    l_0_2[l_0_1] = true
    l_0_3 = l_0_3 + 1
  end
end
if this_sigattrlog[19].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[19].utf8p2)
  l_0_1 = string.match(l_0_0, "(%.[^%.]+)$")
  if l_0_1 == ".exe" then
    l_0_4 = l_0_4 + 1
  elseif l_0_1 ~= nil and l_0_2[l_0_1] == nil and l_0_5[l_0_1] == nil then
    l_0_2[l_0_1] = true
    l_0_3 = l_0_3 + 1
  end
end
if this_sigattrlog[21].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[21].utf8p2)
  l_0_1 = string.match(l_0_0, "(%.[^%.]+)$")
  if l_0_1 == ".exe" then
    l_0_4 = l_0_4 + 1
  elseif l_0_1 ~= nil and l_0_2[l_0_1] == nil and l_0_5[l_0_1] == nil then
    l_0_2[l_0_1] = true
    l_0_3 = l_0_3 + 1
  end
end
if this_sigattrlog[23].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[23].utf8p2)
  l_0_1 = string.match(l_0_0, "(%.[^%.]+)$")
  if l_0_1 == ".exe" then
    l_0_4 = l_0_4 + 1
  elseif l_0_1 ~= nil and l_0_2[l_0_1] == nil and l_0_5[l_0_1] == nil then
    l_0_2[l_0_1] = true
    l_0_3 = l_0_3 + 1
  end
end
if this_sigattrlog[25].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[25].utf8p2)
  l_0_1 = string.match(l_0_0, "(%.[^%.]+)$")
  if l_0_1 == ".exe" then
    l_0_4 = l_0_4 + 1
  elseif l_0_1 ~= nil and l_0_2[l_0_1] == nil and l_0_5[l_0_1] == nil then
    l_0_2[l_0_1] = true
    l_0_3 = l_0_3 + 1
  end
end
if this_sigattrlog[27].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[27].utf8p2)
  l_0_1 = string.match(l_0_0, "(%.[^%.]+)$")
  if l_0_1 == ".exe" then
    l_0_4 = l_0_4 + 1
  elseif l_0_1 ~= nil and l_0_2[l_0_1] == nil and l_0_5[l_0_1] == nil then
    l_0_2[l_0_1] = true
    l_0_3 = l_0_3 + 1
  end
end
if this_sigattrlog[29].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[29].utf8p2)
  l_0_1 = string.match(l_0_0, "(%.[^%.]+)$")
  if l_0_1 == ".exe" then
    l_0_4 = l_0_4 + 1
  elseif l_0_1 ~= nil and l_0_2[l_0_1] == nil and l_0_5[l_0_1] == nil then
    l_0_2[l_0_1] = true
    l_0_3 = l_0_3 + 1
  end
end
if 6 <= l_0_3 and l_0_4 <= 2 then
  local l_0_10 = bm.get_imagepath()
  if not MpCommon.QueryPersistContext(l_0_10, "RunsDestructiveCMDsParent") then
    return mp.INFECTED
  end
  if MpCommon.QueryPersistContext(l_0_10, "RunsDestructiveCMDsParentBlock") then
    mp.ReportLowfi(l_0_10, 1527965087)
  end
  return mp.INFECTED
end
return mp.CLEAN
