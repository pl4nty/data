-- Threat: !InfrastructureShared
-- Name: 234b3de919415
-- Type: 21

local l_0_0 = 60
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = {}

local function l_0_4(l_1_0)
  if l_1_0 == nil or l_0_1 == nil then
    return
  end
  for l_1_1, l_1_2 in ipairs(l_0_1) do
    if l_1_2 == l_1_0 then
      return
    end
  end
  table.insert(l_0_1, l_1_0)
  MpCommon.SetPersistContextNoPath("createdFiles_set_redline", l_0_1, l_0_0)
end

local function l_0_5(l_2_0)
  local l_2_1 = 0
  if l_0_1 == nil or l_2_0 == nil or l_0_2 == nil then
    return
  end
  for l_2_2, l_2_3 in ipairs(l_0_1) do
    if l_2_3 == l_2_0 then
      l_2_1 = 1
      break
    end
  end
  if l_2_1 == 0 then
    return
  end
  for l_2_4, l_2_5 in ipairs(l_0_2) do
    if l_2_5 == l_2_0 then
      return
    end
  end
  table.insert(l_0_2, l_2_0)
  MpCommon.SetPersistContextNoPath("procCreated_set_redline", l_0_2, l_0_0)
end

local function l_0_6(l_3_0)
  if l_0_2 == nil or l_3_0 == nil or l_0_3 == nil then
    return false
  end
  for l_3_1, l_3_2 in ipairs(l_0_3) do
    if l_3_2 == l_3_0 then
      return false
    end
  end
  for l_3_3, l_3_4 in ipairs(l_0_2) do
    if string.find(l_3_4, l_3_0, 1, true) then
      table.insert(l_0_3, l_3_0)
      if 2 <= #l_0_3 then
        return true
      end
      MpCommon.SetPersistContextNoPath("procInj_set_redline", l_0_3, l_0_0)
      return false
    end
  end
  return false
end

if MpCommon.GetPersistContextNoPath("createdFiles_set_redline") ~= nil then
  l_0_1 = MpCommon.GetPersistContextNoPath("createdFiles_set_redline")
end
if MpCommon.GetPersistContextNoPath("procCreated_set_redline") ~= nil then
  l_0_2 = MpCommon.GetPersistContextNoPath("procCreated_set_redline")
end
if MpCommon.GetPersistContextNoPath("procInj_set_redline") ~= nil then
  l_0_3 = MpCommon.GetPersistContextNoPath("procInj_set_redline")
end
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_4(string.lower(this_sigattrlog[4].utf8p1))
end
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_4(string.lower(this_sigattrlog[5].utf8p1))
end
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_4(string.lower(this_sigattrlog[6].utf8p2))
end
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_5(string.lower(this_sigattrlog[7].utf8p1))
end
if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil and l_0_6("\\" .. string.lower(this_sigattrlog[9].utf8p1)) then
  return mp.INFECTED
end
return mp.CLEAN
