-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\afd759a8e0df\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
-- DECOMPILER ERROR at PC6: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC7: Overwrote pending register: R1 in 'AssignReg'

local l_0_1 = (("chrome.exe").GetScannedPPID)()
-- DECOMPILER ERROR at PC12: Overwrote pending register: R2 in 'AssignReg'

if l_0_1 == nil then
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
local l_0_5 = (string.lower)(l_0_4)
l_0_5 = l_0_5:gsub("%s+", " ")
if not l_0_5 or #l_0_5 <= 60 or #l_0_5 > 2200 then
  return mp.CLEAN
end
local l_0_6 = l_0_5:match("#(.*)")
do
  if l_0_6 == nil then
    local l_0_7, l_0_8 = l_0_5:match("\' ([a-z]):\\(.*)")
    if l_0_7 ~= nil and not l_0_8 ~= nil then
      l_0_6 = l_0_7 .. ":\\" .. l_0_8
    end
  end
  if l_0_6 == nil or l_0_6:match("%.exe ") then
    return mp.CLEAN
  end
  l_0_6 = l_0_6:gsub("[\'\"%s]+$", "")
  l_0_6 = l_0_6:gsub("^[\'\"%s]+", "")
  do
    if not l_0_6:match("^\\\\") then
      local l_0_9 = l_0_6:match("^%a:\\")
    end
    -- DECOMPILER ERROR at PC122: Confused about usage of register: R7 in 'UnsetPending'

    if l_0_9 == nil then
      return mp.CLEAN
    end
    local l_0_10 = nil
    if l_0_6:match("^[a-z]?:?\\[a-z0-9 _%.%-\\]+\\[a-z0-9 _%.%-]+%.%a%a%a%a?$") == nil then
      return mp.CLEAN
    end
    if l_0_6:match("%.docx?$") or l_0_6:match("%.pdf$") or l_0_6:match("%.xlsx?$") or not l_0_6:match("%.pptx?$") then
      return mp.CLEAN
    end
    if l_0_4:match("                                  #") or l_0_4:match("#                                  ") or l_0_4:match("                                               (%a:)?\\") then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

