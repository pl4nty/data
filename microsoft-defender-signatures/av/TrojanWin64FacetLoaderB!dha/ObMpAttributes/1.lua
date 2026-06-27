-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\TrojanWin64FacetLoaderB!dha\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
-- DECOMPILER ERROR at PC8: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC9: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC10: Overwrote pending register: R2 in 'AssignReg'

for l_0_4,l_0_5 in ("Win32/AutoIt")("Win32/AutoIt_HSTR1") do
  -- DECOMPILER ERROR at PC13: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC15: Overwrote pending register: R7 in 'AssignReg'

  if (("HSTR:NSIS.gen!A").get_mpattribute)("HSTR:NSIS_Installer") then
    return mp.CLEAN
  end
end
local l_0_6 = (mp.getfilesize)()
if l_0_6 > 10485760 then
  return mp.CLEAN
end
if l_0_6 < 204800 then
  return mp.CLEAN
end
local l_0_7 = pehdr.NumberOfSections
if l_0_7 == nil or l_0_7 == 0 then
  return mp.CLEAN
end
local l_0_8 = pesecs[l_0_7]
if l_0_8 == nil then
  return mp.CLEAN
end
local l_0_9 = l_0_8.PointerToRawData + l_0_8.SizeOfRawData
if l_0_9 == nil or l_0_6 == nil then
  return mp.CLEAN
end
if l_0_6 <= l_0_9 then
  return mp.CLEAN
end
if l_0_6 - l_0_9 < 8 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_10 = (mp.readfile)(l_0_9, 8)
if l_0_10 == nil then
  return mp.CLEAN
end
if l_0_10 == "TINJECT\000" then
  return mp.INFECTED
end
return mp.CLEAN

