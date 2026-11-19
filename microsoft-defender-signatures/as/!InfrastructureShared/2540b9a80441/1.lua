-- Threat: !InfrastructureShared
-- Name: 2540b9a80441
-- Type: 21

if string.lower(string.sub(pe.get_versioninfo().CompanyName, 1, 8)) == "viracure" then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
  return mp.INFECTED
end
return mp.CLEAN
