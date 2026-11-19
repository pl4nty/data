-- Threat: !InfrastructureShared
-- Name: 3dd0ea07e330
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 44540 or 44570 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(14448, 640)
local l_0_2 = l_0_1:find("\">To protect access to your account, you will need to provide your Discover Bank Account Number,", 1, true)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_1:find("<form name=\"regForm1\" id=\"regForm1\" method=\"post\" action=\"http://", l_0_2 + 98, true)
if l_0_3 == nil then
  return mp.CLEAN
end
l_0_3 = l_0_1:find("/wp-", l_0_3 + 74, true)
if l_0_3 == nil then
  return mp.CLEAN
end
l_0_3 = l_0_1:find(".php\" autocomplete=\"on\">", l_0_3 + 5, true)
if l_0_3 == nil then
  return mp.CLEAN
end
return mp.INFECTED
