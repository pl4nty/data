-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a630_790.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetBruteMatchData)()
local l_0_1 = ""
if l_0_0.is_header then
  l_0_1 = (string.lower)(tostring(headerpage))
else
  l_0_1 = (string.lower)(tostring(footerpage))
end
l_0_1 = (string.gsub)(l_0_1, "%z", "")
l_0_1 = (string.gsub)(l_0_1, " ", "")
l_0_1 = (string.gsub)(l_0_1, "`", "")
do
  if (string.find)(l_0_1, "proxy", 1, true) and (string.find)(l_0_1, "::", 1, true) and (string.find)(l_0_1, "defaultnetworkcredentials", 1, true) then
    local l_0_2 = (string.lower)((mp.getfilename)())
    if (string.find)(l_0_2, "->%(%w+%)") or (string.find)(l_0_2, "->%[%w+%]") then
      (mp.set_mpattribute)("SCRIPT:Packed")
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end

