-- Threat: !InfrastructureShared
-- Name: 4141d0322ef8
-- Type: 21

local l_0_0 = "unk"
if this_sigattrlog[2].matched then
  l_0_0 = "warn"
elseif this_sigattrlog[3].matched then
  l_0_0 = "block"
end
local l_0_1 = this_sigattrlog[1].utf8p1 .. ":" .. this_sigattrlog[1].np2
local l_0_2 = {}
l_0_2.SIG_CONTEXT = "NP:COCO:100"
l_0_2.CONTENT_SOURCE = "NP"
l_0_2.NP_LEVEL = l_0_0
l_0_2.C2 = "true"
local l_0_3 = mp.GetUrlReputation({l_0_1}, l_0_2)
if l_0_3 ~= nil then
  local l_0_4 = l_0_3.urls
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    if l_0_6.determination == 2 and l_0_6.confidence > 90 then
      if l_0_6.urlresponsecontext.family then
        local l_0_7 = {
          [1] = 805306694,
          [2] = 805306695,
          [3] = 805306694
        }
        local l_0_8 = l_0_7[l_0_6.urlresponsecontext.family]
        if l_0_8 then
          mp.changedetectionname(l_0_8)
        end
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
