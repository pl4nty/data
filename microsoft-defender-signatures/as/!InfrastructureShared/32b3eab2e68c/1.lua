-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3eab2e68c\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3, l_0_4 = nil, nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil and (this_sigattrlog[1]).utf8p2 ~= "" then
  l_0_3 = (this_sigattrlog[1]).utf8p2
else
  return mp.CLEAN
end
l_0_4 = (string.lower)(l_0_3)
local l_0_5 = {}
-- DECOMPILER ERROR at PC66: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC67: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC69: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC70: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC71: Overwrote pending register: R9 in 'AssignReg'

if ((".nib").find)(".png", ".jpeg", ".jpg", true) then
  local l_0_6 = (string.match)(l_0_4, "(.-)/contents")
  for l_0_10,l_0_11 in pairs(l_0_5) do
    -- DECOMPILER ERROR at PC85: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC87: Overwrote pending register: R13 in 'AssignReg'

    local l_0_12 = ((".dmg").len)(".pkg")
    -- DECOMPILER ERROR at PC93: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC94: Overwrote pending register: R15 in 'AssignReg'

    -- DECOMPILER ERROR at PC95: Overwrote pending register: R16 in 'AssignReg'

    if l_0_11 ~= nil and (string.find)(".doc", ".ppt", ".pptx", true) then
      if (sysio.IsFileExists)(l_0_3) then
        (bm.add_threat_file)(l_0_3)
      end
      if SuspMacPathsToMonitor(l_0_2, true) or (string.find)(l_0_2, "/Users/[^/]+/Downloads/", 1, false) or (string.find)(l_0_2, "/Users/[^/]+/Documents/", 1, false) or (string.find)(l_0_2, "/Users/[^/]+/Desktop/", 1, false) then
        return mp.INFECTED
      end
    end
  end
end
do
  do
    -- DECOMPILER ERROR at PC149: Overwrote pending register: R6 in 'AssignReg'

    do return l_0_6 end
    -- WARNING: undefined locals caused missing assignments!
  end
end

