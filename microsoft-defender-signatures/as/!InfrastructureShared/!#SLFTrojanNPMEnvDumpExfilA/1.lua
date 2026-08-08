-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanNPMEnvDumpExfilA\1.luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() > 5120 then
  return mp.CLEAN
end
if (mp.get_mpattribute)("SCPT:NpmY_ReqHttp") or (mp.get_mpattribute)("SCPT:NpmY_ReqAxios") or (mp.get_mpattribute)("SCPT:NpmY_ReqNodeFetch") or (mp.get_mpattribute)("SCPT:NpmY_ReqDns") then
  return mp.INFECTED
end
return mp.CLEAN

