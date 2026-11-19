-- Threat: !InfrastructureShared
-- Name: a8783f6f9284
-- Type: 21

if pevars.epsec < pehdr.NumberOfSections or mp.readu_u32(epcode, 1) ~= 2030270560 or peattributes.epoutofimage or peattributes.amd64_image or pehdr.SizeOfImage > mp.getfilesize() then
  mp.changedetectionname(805306412)
  return mp.INFECTED
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_INMEMORY then
  return mp.CLEAN
end
return mp.INFECTED
