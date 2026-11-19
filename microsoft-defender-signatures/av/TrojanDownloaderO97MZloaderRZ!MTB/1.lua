-- Threat: TrojanDownloader:O97M/Zloader.RZ!MTB
-- Type: 13
-- MpAttributes: AGG:O97M/Zloader.RZ

mp.readprotection(false)
local l_0_0 = tostring(mp.readfile(512, 512))
if string.find(l_0_0, "M%zi%zc%zr%zo%zs%zo%zf%zt%z %zE%zn%zh%za%zn%zc%ze%zd%z %zC%zr%zy%zp%zt%zo%zg%zr%za%zp%zh%zi%zc%z %zP%zr%zo%zv%zi%zd%ze%zr%z %zv%z1%z") ~= nil then
  local l_0_1 = tostring(mp.readfile(34048, 1280))
  if string.find(l_0_1, "Excel 4.0 Macros") ~= nil then
    local l_0_2 = tostring(mp.readfile(38288, 1536))
    if string.find(l_0_2, "R%zo%zo%zt%z %zE%zn%zt%zr%zy%z") ~= nil then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
