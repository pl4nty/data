-- Threat: !InfrastructureShared
-- Name: 21296438eef3
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
l_0_0 = tostring(headerpage)
l_0_1 = string.match(l_0_0, "\\rundll32%.?e?x?e?(.*),%w+")
if l_0_1 ~= nil then
  l_0_1 = l_0_1:lower()
  if contains(l_0_1, {
    ".dll",
    ".ocx",
    ".cpl",
    ".xla",
    ".xlam",
    ".xll",
    ".vsto",
    ".olb",
    "--no-sandbox",
    "zebra_default.dat",
    "program files",
    "sogoutsf.ime",
    ".ax",
    ".wll",
    "setupinfobjectinstallaction",
    "openas_rundll"
  }) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
