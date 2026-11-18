-- Threat: !InfrastructureShared
-- Name: 55414e0bf762
-- Type: 21

if not mp.get_mpattribute("PUA:CERT:PCAppStore") then
  return mp.CLEAN
end
if this_sigattrlog[2].matched and this_sigattrlog[4].matched then
  local l_0_0 = this_sigattrlog[2].p2
  local l_0_1 = this_sigattrlog[4].p2
  if l_0_0 ~= l_0_1 and not l_0_1:lower():find("pc +app +store +setup$") then
    return mp.CLEAN
  end
  local l_0_2 = l_0_0:lower()
  if l_0_2:find("^spark +setup$") or l_0_0:find("^fast[!]? +setup$") then
    return mp.CLEAN
  end
  local l_0_3 = {
    "^personal +store +setup$",
    "shop +setup$",
    "market +setup$",
    "marketplace +setup$",
    "buy +setup$",
    "baz[a-z]*ar[a-z]* +setup$",
    "sale +setup$",
    "rep +setup$",
    "repository +setup$",
    "soft +setup$",
    "software +setup$",
    "product +setup$",
    "prod +setup$",
    "tool +setup$",
    "package +setup$",
    "platform +setup$",
    "selection +setup$",
    "download +setup$",
    "offer +setup$",
    "item +setup$",
    "data +setup$",
    "element +setup$",
    "property +setup$",
    "thing +setup$",
    "commodity +setup$",
    "^rev +[0-9][0-9][0-9]+[a-z]+ +setup$",
    "^build +[0-9][0-9][0-9]+[a-z]+ +setup$",
    "^bld +[0-9][0-9][0-9]+[a-z]+ +setup$",
    "^[a-z][a-z]? +[0-9][0-9][0-9]+[a-z]* +setup$",
    "^our +setup$",
    "yours +setup$",
    "the +setup$",
    "nice +setup$",
    "because +setup$",
    "just +setup$",
    "bbb +setup$",
    "why +setup$",
    "when +setup$",
    "absolutely +setup$",
    "regards +setup$",
    "flower +setup$",
    "rain +setup$",
    "wind +setup$",
    "earth +setup$",
    "planet +setup$",
    "captain +setup$",
    "mountain +setup$",
    "hill +setup$",
    "foot +setup$",
    "feet +setup$",
    "legs +setup$",
    "hands +setup$",
    "nose +setup$",
    "ears +setup$",
    "chin +setup$",
    "scalp +setup$",
    "magic +setup$",
    "dragon +setup$",
    "ball +setup",
    "hoop +setup$",
    "shins +setup$",
    "sand +setup$",
    "ciao +setup$",
    "foam +setup$",
    "concert +setup$",
    "violin +setup$",
    "happy +setup$",
    "sad +setup$",
    "possibly +setup$",
    "could *be +setup$",
    "morning +setup$",
    "brunch +setup$",
    "dairy +setup$",
    "evening +setup$",
    "farm +setup$",
    "[a-np-z]oo+ +setup$",
    "shed +setup$",
    "unbow +setup$",
    "arch +setup$",
    "medi +setup$",
    "lem +setup$",
    "[b-z]ostan +setup$",
    "[b-z]ur[b-z]ur +setup$",
    "^[a-z][a-z]?[a-z]?[a-z]?[a-z]? +setup$"
  }
  for l_0_4 = 1, #l_0_3 do
    if l_0_2:find(l_0_3[l_0_4]) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
