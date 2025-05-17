-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7fad_luac 

-- params : ...
-- function num : 0
if ((pe.get_versioninfo)()).OriginalFilename == "riched32.dll" and ((pe.get_versioninfo)()).CompanyName == "Microsoft Corporation" then
  return mp.INFECTED
end
return mp.CLEAN

