-- Threat: !InfrastructureShared
-- Name: 134789d999109
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("HSTR:Win32/Emotet")
end
return mp.INFECTED
