-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d6b3105e5af8\0x0000094b_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if not (string.find)(l_0_2, "com.apple.webkit.networking", 1, true) and not (string.find)(l_0_2, "com.apple.safari.sandboxbroker", 1, true) and (IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2)) then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  l_0_3 = (this_sigattrlog[1]).utf8p2
else
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
    l_0_3 = (this_sigattrlog[2]).utf8p2
  else
    if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
      l_0_3 = (this_sigattrlog[3]).utf8p2
    else
      if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil then
        l_0_3 = (this_sigattrlog[4]).utf8p2
      else
        if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil then
          l_0_3 = (this_sigattrlog[5]).utf8p2
        else
          return mp.CLEAN
        end
      end
    end
  end
end
local l_0_4 = (string.lower)(l_0_3)
if (string.find)(l_0_4, "/bin/", 1, true) == 1 or (((string.find)(l_0_4, "/usr/", 1, true) == 1 and not (string.find)(l_0_4, "/usr/local/", 1, true) == 1) or (string.find)(l_0_4, "/applications/microsoft defender.app/", 1, true) == 1) then
  return mp.CLEAN
end
local l_0_5 = l_0_3:match("[^/]*$")
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
local l_0_6 = l_0_5:match("(.+)%..+")
if l_0_6 == nil or l_0_6 == "" then
  l_0_6 = l_0_5
end
local l_0_7 = (string.lower)(l_0_6)
local l_0_8 = l_0_7:gsub("%W", "")
do
  local l_0_9 = {}
  -- DECOMPILER ERROR at PC305: No list found for R9 , SetList fails

  -- DECOMPILER ERROR at PC306: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC307: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC308: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC309: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC310: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC311: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC312: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC313: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC314: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC315: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC316: No list found for R9 , SetList fails

  -- DECOMPILER ERROR at PC317: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC318: Overwrote pending register: R11 in 'AssignReg'

  for l_0_13,l_0_14 in ("visualstudio")("adobe") do
    -- DECOMPILER ERROR at PC323: Overwrote pending register: R15 in 'AssignReg'

    if l_0_8 == l_0_14 then
      return ("celastradepro").INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

