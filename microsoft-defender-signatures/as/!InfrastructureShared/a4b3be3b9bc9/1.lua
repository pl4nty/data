-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a4b3be3b9bc9\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
  l_0_3 = (this_sigattrlog[2]).utf8p2
end
if l_0_3 == "" or l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = function(l_1_0)
  -- function num : 0_0
  if not l_1_0 then
    return nil, nil
  end
  local l_1_1, l_1_2 = l_1_0:match("^%s*cp%s+\"([^\"]+)\"%s+\"([^\"]+)\"%s*$")
  if l_1_1 then
    return l_1_1, l_1_2
  end
  l_1_1 = l_1_0:match("^%s*cp%s+\'([^\']+)\'%s+\'([^\']+)\'%s*$")
  if l_1_1 then
    return l_1_1, l_1_2
  end
  local l_1_3 = "^%s*cp%s+(([^%s]*(\\%s[^%s]*)*))%s+(([^%s]*(\\%s[^%s]*)*))%s*$"
  -- DECOMPILER ERROR at PC26: Overwrote pending register: R2 in 'AssignReg'

  l_1_1 = l_1_0:match(l_1_3)
  if l_1_1 then
    l_1_1 = l_1_1:gsub("\\ ", " ")
    -- DECOMPILER ERROR at PC41: Overwrote pending register: R2 in 'AssignReg'

    return l_1_1, l_1_2
  end
  -- DECOMPILER ERROR at PC48: Overwrote pending register: R2 in 'AssignReg'

  l_1_1 = l_1_0:match("^%s*cp%s+(.-)%s+(/.+)%s*$")
  if l_1_1 then
    return l_1_1, l_1_2
  end
  return nil, nil
end

local l_0_5 = nil
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil and (this_sigattrlog[3]).utf8p2 ~= "" then
  l_0_5 = (this_sigattrlog[3]).utf8p2
end
if l_0_5 == "" or l_0_5 == nil then
  return mp.CLEAN
end
local l_0_6, l_0_7 = l_0_4(l_0_5)
if l_0_6 == "" or l_0_6 == nil or l_0_7 == "" or l_0_7 == nil then
  return mp.CLEAN
end
local l_0_8 = nil
if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil and (this_sigattrlog[4]).utf8p2 ~= "" then
  l_0_8 = (this_sigattrlog[4]).utf8p2
end
if l_0_8 == "" or l_0_8 == nil then
  return mp.CLEAN
end
if l_0_3 == l_0_6 and (string.find)(l_0_8, l_0_7, 1, true) and ((string.find)(l_0_8, "com.apple.", 1, true) or (string.find)(l_0_8, "com.zoom.", 1, true) or (string.find)(l_0_8, "com.python.", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN

