-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#PUABlockFileZilla_BundleInstaller\1.luac 

-- params : ...
-- function num : 0
if (mp.UfsGetMetadataBool)("LUAUFS:NSISFileZillaBndlCert", true) == 0 and "LUAUFS:NSISFileZillaBndlCert" then
  return mp.INFECTED
end
return mp.CLEAN

