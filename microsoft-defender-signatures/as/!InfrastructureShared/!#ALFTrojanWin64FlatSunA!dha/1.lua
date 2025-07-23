-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin64FlatSunA!dha\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("Lua:FnameAttr!radcui.dll") then
  return mp.CLEAN
end
if (mp.get_mpattribute)("Lua:FirstFolder1!windows") then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 7 or (pe.foffset_rva)(4096) ~= 1024 then
  return mp.CLEAN
end
if (mp.getfilename)(mp.FILEPATH_QUERY_FNAME) ~= "radcui.dll" then
  return mp.CLEAN
end
if (pe.get_imports)() > 110 then
  return mp.CLEAN
end
return mp.INFECTED

