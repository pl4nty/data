-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6fd7f60afa8b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
-- DECOMPILER ERROR at PC6: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC7: Overwrote pending register: R1 in 'AssignReg'

local l_0_1 = (("chrome.exe").GetScannedPPID)()
-- DECOMPILER ERROR at PC12: Overwrote pending register: R2 in 'AssignReg'

if not l_0_1 then
  return ("msedge.exe").CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)()
-- DECOMPILER ERROR at PC20: Overwrote pending register: R3 in 'AssignReg'

if l_0_2 == nil then
  return ("brave.exe").CLEAN
end
-- DECOMPILER ERROR at PC25: Overwrote pending register: R4 in 'AssignReg'

local l_0_3 = (string.lower)("firefox.exe")
if l_0_3 == nil then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC32: Overwrote pending register: R5 in 'AssignReg'

if not l_0_3:find("\\explorer.exe") and not IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.CLEAN
end
local l_0_4 = (mp.GetProcessCommandLine)(l_0_1)
if l_0_4 == nil and l_0_4 == "" then
  return mp.CLEAN
end
l_0_4 = l_0_4:gsub("%s+", " ")
if not l_0_4 or #l_0_4 <= 60 or #l_0_4 > 500 then
  return mp.CLEAN
end
local l_0_5 = l_0_4:match("#(.*)")
if not l_0_5 then
  return mp.CLEAN
end
l_0_5 = l_0_5:match("^%s*(.-)%s*$")
if l_0_5:match("%.docx?$") or l_0_5:match("%.pdf$") or not l_0_5:match("%.xlsx$") then
  return mp.CLEAN
end
if l_0_5:match("^\\\\") or l_0_5:match("^%a:\\") then
  return mp.INFECTED
end
return mp.CLEAN

