-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Plexus\1.luac 

-- params : ...
-- function num : 0
if (string.match)((Remediation.Threat).Name, "Plexus") then
  Infrastructure_FixHostsFile()
end

