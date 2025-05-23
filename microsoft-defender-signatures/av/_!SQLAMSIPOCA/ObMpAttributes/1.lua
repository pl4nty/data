-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!SQLAMSIPOCA\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
if pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME) and mp.get_contextdata == "SQL Server AMSI Agent" then
  return mp.INFECTED
end
return mp.CLEAN

