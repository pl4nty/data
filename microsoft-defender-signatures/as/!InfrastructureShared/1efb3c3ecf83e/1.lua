-- Threat: !InfrastructureShared
-- Name: 1efb3c3ecf83e
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
local l_0_2 = {
  "/code",
  "/cursor",
  "/windsurf",
  "/node",
  "/python3",
  "/python",
  "/git",
  "/vim",
  "/nvim",
  "/nano",
  "/emacs",
  "/sublime_text",
  "/zed",
  "/hx",
  "/helix",
  "/fleet",
  "/code-server",
  "/claude"
}
if contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1565.001", "Impact")
add_parents()
return mp.INFECTED
