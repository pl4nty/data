-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaEnableEntropyCalcA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = extractAllFileNameExtensions(l_0_0)
if l_0_2 == nil or l_0_2 == 0 then
  return mp.CLEAN
end
if l_0_2 > 1 then
  local l_0_3 = l_0_1[1] .. "|"
  local l_0_4 = ".doc|.docx|.docm|.xls|.xlsx|.xlsm|.ppt|.pptx|.pptm|.pdf|.xps|.jpg|.jpeg|.bmp|.png|.gif|"
  local l_0_5 = ".txt|.log|.exe|.dll|.ocx|.cs|.cpp|.ps1|.psm1|.rs|.go|.json|.xml|.html|.mhtml|.h|.lib|.js|.class|.jar|.dmp|"
  local l_0_6 = ".dit|.edb|.mdb|.reg|.pdb|.bak|"
  if l_0_4:find(l_0_3, 1, true) or l_0_5:find(l_0_3, 1, true) or l_0_6:find(l_0_3, 1, true) then
    local l_0_7 = (mp.GetExtensionClass)(l_0_1[2])
    if l_0_7 ~= 0 then
      return mp.CLEAN
    end
    ;
    (mp.set_mpattribute)("Lua:EnableEntropyCalc")
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

