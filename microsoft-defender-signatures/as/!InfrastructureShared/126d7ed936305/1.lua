-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\126d7ed936305\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
if l_0_1:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
;
(mp.set_mpattribute)("ClickFix_PS_Explorer_parent")
local l_0_2 = (mp.GetScannedPPID)()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
if #l_0_3 < 50 then
  return mp.CLEAN
end
if #l_0_3 > 450 then
  return mp.CLEAN
end
;
(mp.set_mpattribute)("ClickFix_PS_cmdline_lt450")
local l_0_4, l_0_5 = (MpCommon.StringRegExpSearch)("(?i)[^\\w\\d\\s]w[indowstyle]*\\s+(?:h[iden]*|1|minimized)\\s+", l_0_3)
if not l_0_4 then
  return mp.CLEAN
end
;
(mp.set_mpattribute)("ClickFix_PS_found_hidden")
local l_0_6 = {}
-- DECOMPILER ERROR at PC91: No list found for R6 , SetList fails

-- DECOMPILER ERROR at PC92: Overwrote pending register: R7 in 'AssignReg'

local l_0_7 = "iwr"
-- DECOMPILER ERROR at PC93: Overwrote pending register: R8 in 'AssignReg'

local l_0_8 = "iex"
-- DECOMPILER ERROR at PC94: Overwrote pending register: R9 in 'AssignReg'

local l_0_9 = "irm"
-- DECOMPILER ERROR at PC95: Overwrote pending register: R10 in 'AssignReg'

local l_0_10 = "curl"
-- DECOMPILER ERROR at PC96: Overwrote pending register: R11 in 'AssignReg'

local l_0_11 = "bitsadmin"
-- DECOMPILER ERROR at PC97: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC97: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC98: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC99: Overwrote pending register: R15 in 'AssignReg'

;
("e%:jscript")("downloadstring", "invoke%-restmethod", "invoke%-webrequest")
l_0_3:gsub("\'(.-)\'", function()
  -- function num : 0_1 , upvalues : l_0_8
  l_0_8 = l_0_8 + 1
end
)
-- DECOMPILER ERROR at PC110: Overwrote pending register: R16 in 'AssignReg'

-- DECOMPILER ERROR at PC111: Overwrote pending register: R17 in 'AssignReg'

local l_0_12 = l_0_7 + l_0_8 + l_0_9 + l_0_10 + l_0_11
local l_0_13 = 10
if l_0_13 > l_0_12 then
  return mp.CLEAN
end
;
(mp.set_mpattribute)("ClickFix_PS_total_obfuscation_signals_gt10")
local l_0_14 = (string.gsub)(l_0_3, "[\"\'`^()+#&]", "")
do
  local l_0_15 = str_count_match(l_0_14, l_0_6)
  if l_0_15 >= 2 then
    (mp.set_mpattribute)("ClickFix_PS_susp_string_gt2")
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

