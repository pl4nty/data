-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#MpOnFileExecuteRtpScan\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_parent_filehandle)()
if not (mp.is_handle_nil)(l_0_0) then
  return mp.CLEAN
end
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
if (mp.get_contextdata)(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) == true or (mp.bitand)((mp.get_contextdata)(mp.CONTEXT_DATA_DESIREDACCESS), 32) == 32 then
  return mp.INFECTED
end
return mp.CLEAN

