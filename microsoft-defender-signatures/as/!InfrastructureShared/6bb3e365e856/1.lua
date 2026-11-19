-- Threat: !InfrastructureShared
-- Name: 6bb3e365e856
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  "antoniocruzsvc.com",
  "trafalgarupcc.com",
  "gidosdelicacy.com",
  "mansonsmagicmax.com",
  "florabrocuisine.com",
  "alblasschoonhulp.com",
  "petite-boulangerie.com",
  "petsandfitness.com",
  "dacostamakeup.com",
  "countytopseeds.com"
}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if string.find(l_0_0, l_0_3, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
