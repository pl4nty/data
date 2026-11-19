-- Threat: !InfrastructureShared
-- Name: 9f78535e9689
-- Type: 21

local l_0_0 = {
  [332] = "do_exhaustivehstr_rescan",
  [34404] = "do_exhaustivehstr_64bit_rescan"
}
local l_0_1 = {
  [332] = 805306483,
  [34404] = 805306484
}
if mp.getfilesize() > 1048576 then
  return mp.CLEAN
end
if not peattributes.isdll or not peattributes.hasexports then
  return mp.CLEAN
end
if l_0_0[pehdr.Machine] == nil or l_0_1[pehdr.Machine] == nil then
  return mp.CLEAN
end
if hstrlog[3].matched then
  return mp.CLEAN
end
local l_0_2 = pe.get_versioninfo()
if l_0_2 == nil or l_0_2.InternalName ~= "dnsapi" or l_0_2.CompanyName ~= "Microsoft Corporation" then
  return mp.CLEAN
end
if not (hstrlog[4].matched and hstrlog[5].matched) or not hstrlog[6].matched then
  mp.set_mpattribute(l_0_0[pehdr.Machine])
  return mp.CLEAN
end
if hstrlog[7].matched then
  mp.changedetectionname(l_0_1[pehdr.Machine])
end
return mp.INFECTED
