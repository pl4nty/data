-- Threat: !InfrastructureShared
-- Name: 2db32d5d73c7
-- Type: 21

local l_0_0, l_0_1, l_0_2
l_0_0 = this_sigattrlog[2].utf8p1
if l_0_0 ~= nil then
  l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_0)
  l_0_2 = string.lower(string.gsub(l_0_1, "p%zi%zd%zl%zo%zc%z.%zt%zx%zt%z", "W%zi%zn%zd%zo%zw%zs%zU%zp%zd%za%zt%ze%z.%ze%zx%ze%z"))
  l_0_2 = l_0_2 .. "\000\000"
  mp.ReportLowfi(l_0_2, 618978737)
end
return mp.INFECTED
