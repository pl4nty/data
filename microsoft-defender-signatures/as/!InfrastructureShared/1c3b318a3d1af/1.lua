-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1c3b318a3d1af\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  if type(l_1_0) ~= "string" then
    return nil
  end
  local l_1_1 = l_1_0:match("\"([^\"]-%.[dD][lL][lL])\"")
  if l_1_1 then
    return l_1_1
  end
  local l_1_2 = l_1_0:match("([a-zA-Z]:[\\/][^<>:\"|%?%*]-%.[dD][lL][lL])")
  if l_1_2 then
    return l_1_2
  end
  local l_1_3 = l_1_0:match("(\\\\[^<>:\"|%?%*]-%.[dD][lL][lL])")
  if l_1_3 then
    return l_1_3
  end
  return l_1_0:match("([%w%._%-%\\/%(%)~]+%.[dD][lL][lL])")
end

if not (this_sigattrlog[2]).matched then
  return mp.CLEAN
end
if (this_sigattrlog[2]).utf8p2 == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)((this_sigattrlog[2]).utf8p2)
local l_0_2 = (bm.get_imagepath)()
if l_0_2 ~= nil then
  l_0_2 = (string.lower)(l_0_2)
  if (string.find)(l_0_2, "\\windows defender\\", 1, true) then
    return mp.CLEAN
  end
  if (string.find)(l_0_2, "\\sense\\", 1, true) then
    return mp.CLEAN
  end
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC72: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC73: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC74: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC75: Overwrote pending register: R6 in 'AssignReg'

if ("shell32.dll")("printui.dll", "dfshim.dll") then
  return mp.CLEAN
end
local l_0_4 = l_0_0(l_0_1)
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = (mp.ContextualExpandEnvironmentVariables)(l_0_4)
if l_0_5 == nil then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC101: Overwrote pending register: R7 in 'AssignReg'

local l_0_6 = (string.lower)("davclnt.dll")
local l_0_7 = {}
-- DECOMPILER ERROR at PC104: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC105: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC106: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC107: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC108: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC109: No list found for R7 , SetList fails

-- DECOMPILER ERROR at PC110: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC111: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC112: Overwrote pending register: R10 in 'AssignReg'

if ("url.dll")("shdocvw.dll", "ieframe.dll") then
  return mp.CLEAN
end
if (mp.IsKnownFriendlyFile)(l_0_5, true, false) then
  return mp.CLEAN
end
local l_0_8 = (bm.get_current_process_startup_info)()
do
  do
    if l_0_8 and next(l_0_8) and l_0_8.command_line then
      local l_0_9 = (string.lower)(l_0_8.command_line)
      -- DECOMPILER ERROR at PC149: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC149: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC150: Overwrote pending register: R14 in 'AssignReg'

      bm_AddRelatedFileFromCommandLine(l_0_9, "keymgr.dll", "cryptui.dll", "zipfldr.dll")
      ;
      (bm.request_SMS)(l_0_8.ppid, "h+")
      ;
      (bm.add_action)("SmsAsyncScanEvent", 1)
      ;
      (bm.add_related_string)("[->] MEDICATED CMD: ", l_0_9, bm.RelatedStringBMReport)
    end
    triggerMemoryScanOnProcessTree(true, false, "SMS_H", 5000, "Behavior:Win32/SusDllExec.AL!sms")
    add_parents()
    do return mp.INFECTED end
    -- WARNING: undefined locals caused missing assignments!
  end
end

