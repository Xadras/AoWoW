<script type="text/javascript" src="templates/wowhead/js/filters.js?{$AOWOW_REVISION}"></script>
<div id="fi">

<form method="post" name="fi" onsubmit="filterz();return false" onreset="return filterz_reset()">

<div class="rightpanel">
<div style="float: left">Quality: </div><small><a href="javascript:;" onclick="document.forms['fi'].elements['qu'].selectedIndex = -1; return false" onmousedown="return false">clear</a></small>
<div class="clear"></div>
<select name="qu" size="7" multiple="multiple" class="rightselect" style="background-color: #181818">
<option value="0" class="q0">Poor</option>
<option value="1" class="q1">Common</option>
<option value="2" class="q2">Uncommon</option>
<option value="3" class="q3">Rare</option>
<option value="4" class="q4">Epic</option>
<option value="5" class="q5">Legendary</option>
<option value="6" class="q6">Artifact</option>
<!--<option value="7" class="q7">Heirloom</option>-->
</select>
</div>
{if $page.class == 2 && $page.subclass == null}
<div class="rightpanel2">
<div style="float: left">Slot: </div><small><a href="javascript:;" onclick="document.forms['fi'].elements['sl'].selectedIndex = -1; return false" onmousedown="return false">clear</a></small>
<div class="clear"></div>
<select name="sl" size="6" multiple="multiple" class="rightselect">
<option value="21">Main Hand</option>
<option value="22">Off Hand</option>
<option value="13">One-Hand</option>
<option value="15">Ranged</option>
<option value="25">Thrown</option>
<option value="17">Two-Hand</option>
</select>
</div>
<div class="rightpanel2">
<div style="float: left">Type: </div><small><a href="javascript:;" onclick="document.forms['fi'].elements['ty'].selectedIndex = -1; return false" onmousedown="return false">clear</a></small>
<div class="clear"></div>
<select name="ty" size="7" multiple="multiple" class="rightselect">
<option value="15">Daggers</option>
<option value="13">Fist Weapons</option>
<option value="0">One-Handed Axes</option>
<option value="4">One-Handed Maces</option>
<option value="7">One-Handed Swords</option>
<option value="6">Polearms</option>
<option value="10">Staves</option>
<option value="1">Two-Handed Axes</option>
<option value="5">Two-Handed Maces</option>
<option value="8">Two-Handed Swords</option>
<option value="2">Bows</option>
<option value="18">Crossbows</option>
<option value="3">Guns</option>
<option value="16">Thrown</option>
<option value="19">Wands</option>
<option value="20">Fishing Poles</option>
<option value="14">Miscellaneous (Weapons)</option>
</select>
</div>
{/if}
{if $page.class == 4 && $page.subclass == null}
<div class="rightpanel2">
<div style="float: left">Slot: </div><small><a href="javascript:;" onclick="document.forms['fi'].elements['sl'].selectedIndex = -1; return false" onmousedown="return false">clear</a></small>
<div class="clear"></div>
<select name="sl" size="7" multiple="multiple" class="rightselect">
<option value="16">Back</option>
<option value="5">Chest</option>
<option value="8">Feet</option>
<option value="11">Finger</option>
<option value="10">Hands</option>
<option value="1">Head</option>
<option value="23">Held In Off-hand</option>
<option value="7">Legs</option>
<option value="2">Neck</option>
<option value="28">Relic</option>
<option value="14">Shield</option>
<option value="4">Shirt</option>
<option value="3">Shoulder</option>
<option value="19">Tabard</option>
<option value="12">Trinket</option>
<option value="6">Waist</option>
<option value="9">Wrist</option>
</select>
</div>
<div class="rightpanel2">
<div style="float: left">Type: </div><small><a href="javascript:;" onclick="document.forms['fi'].elements['ty'].selectedIndex = -1; return false" onmousedown="return false">clear</a></small>
<div class="clear"></div>
<select name="ty" size="7" multiple="multiple" class="rightselect">
<option value="1">Cloth Armor</option>
<option value="2">Leather Armor</option>
<option value="3">Mail Armor</option>
<option value="4">Plate Armor</option>
{*<option value="-2">Amulets</option>
<option value="-16">Cloaks</option>*}
<option value="8">Idols</option>
<option value="7">Librams</option>
{*<option value="-23">Off-hand Frills</option>
<option value="-28">Relics</option>
<option value="-11">Rings</option>
<option value="-19">Tabards</option>
<option value="-12">Trinkets</option>*}
<option value="6">Shields</option>
{*<option value="-4">Shirts</option>*}
<option value="9">Totems</option>
{*<option value="10">Sigils</option>*}
<option value="0">Miscellaneous (Armor)</option>
</select>
</div>
{/if}
{if $page.class == null}
<div class="rightpanel2">
<div style="float: left">Slot: </div><small><a href="javascript:;" onclick="document.forms['fi'].elements['sl'].selectedIndex = -1; return false" onmousedown="return false">clear</a></small>
<div class="clear"></div>
<select name="sl" size="7" multiple="multiple" class="rightselect">
<option value="16">Back</option>
<option value="18">Bag</option>
<option value="5">Chest</option>
<option value="8">Feet</option>
<option value="11">Finger</option>
<option value="10">Hands</option>
<option value="1">Head</option>
<option value="23">Held In Off-hand</option>
<option value="7">Legs</option>
<option value="21">Main Hand</option>
<option value="2">Neck</option>
<option value="22">Off Hand</option>
<option value="13">One-Hand</option>
<option value="24">Projectile</option>
<option value="15">Ranged</option>
<option value="28">Relic</option>
<option value="14">Shield</option>
<option value="4">Shirt</option>
<option value="3">Shoulder</option>
<option value="19">Tabard</option>
<option value="25">Thrown</option>
<option value="12">Trinket</option>
<option value="17">Two-Hand</option>
<option value="6">Waist</option>
<option value="9">Wrist</option>
</select>
</div>
{/if}
<table>
<tbody><tr>
<td>Name: </td>
<td colspan="2">&nbsp;<input type="text" name="na" size="30" style="width: 214px;"></td>
<td></td>
</tr><tr>
<td class="padded">Level: </td><td class="padded">&nbsp;<input id="minl" onchange="filter_is_int(this);" type="text" name="minle" maxlength="3" class="smalltextbox2"> - <input onchange="filter_is_int(this);" type="text" name="maxle" maxlength="3" class="smalltextbox2"></td>
<td class="padded"><table><tbody><tr><td>&nbsp;Req. level: </td><td>&nbsp;<input onchange="filter_is_int(this);" type="text" name="minrl" maxlength="2" class="smalltextbox"> - <input onchange="filter_is_int(this);" type="text" name="maxrl" maxlength="2" class="smalltextbox"></td></tr></tbody></table></td><td></td>
</tr>{*<tr><td class="padded">Usable by: </td><td class="padded">&nbsp;<select name="si" style="margin-right: 0.5em">
<option></option>
<option value="1">Alliance</option>
<option value="-1">Alliance only</option>
<option value="2">Horde</option>
<option value="-2">Horde only</option>
<option value="3">Both</option>
</select>
</td>
<td class="padded"><select name="ub">
<option></option>
<option value="6">Death Knight</option>
<option value="11">Druid</option>
<option value="3">Hunter</option>
<option value="8">Mage</option>
<option value="2">Paladin</option>
<option value="5">Priest</option>
<option value="4">Rogue</option>
<option value="7">Shaman</option>
<option value="9">Warlock</option>
<option value="1">Warrior</option>
</select></td></tr><tr>
<td class="padded"><dfn title="" class="tip">Color</dfn>:</td>
<td class="padded"><div class="color-selector"><div style="background-color: "><input type="text" value="" maxlength="7" size="7" id="color" name="color" class=""></div></div></td></tr>*}</tbody></table>

{*<div id="fi_criteria" class="padded criteria"><div><select name="cr[]"><option></option><optgroup label="General"><option value="166">Added in expansion</option><option value="82">Added in patch</option><option value="2">Binds when picked up</option><option value="3">Binds when equipped</option><option value="4">Binds when used</option><option value="133">Binds to Battle.net account</option><option value="178">Transmogrifiable</option><option value="152">Class-specific</option><option value="107">Effect text</option><option value="81">Fits a gem slot</option><option value="132">Glyph type</option><option value="80">Has sockets</option><option value="146">Heroic item</option><option value="142">Icon</option><option value="151">ID</option><option value="100">Number of sockets</option><option value="153">Race-specific</option><option value="124">Random enchantments (of the...)</option><option value="125">Required personal and team arena rating</option><option value="111">Required skill level</option><option value="99">Requires a profession</option><option value="66">Requires a profession specialization</option><option value="17">Requires reputation with...</option><option value="169">Requires a world event</option><option value="160">Related world event</option><option value="168">Teaches a spell</option><option value="15">Unique</option><option value="83">Unique-Equipped</option></optgroup><optgroup label="Base stats"><option value="21">Agility</option><option value="23">Intellect</option><option value="22">Stamina</option><option value="24">Spirit</option><option value="20">Strength</option><option value="115">Health</option><option value="60">Health regeneration</option><option value="116">Mana</option><option value="170">Mastery rating</option></optgroup><optgroup label="Defensive stats"><option value="41">Armor</option><option value="45">Dodge rating</option><option value="46">Parry rating</option><option value="79">Resilience rating</option></optgroup><optgroup label="Offensive stats"><option value="77">Attack power</option><option value="96">Critical strike rating</option><option value="117">Expertise rating</option><option value="103">Haste rating</option><option value="119">Hit rating</option><option value="94">Spell penetration</option><option value="123">Spell power</option></optgroup><optgroup label="Weapon stats"><option value="32">Damage per second</option><option value="35">Damage type</option><option value="33">Minimum damage</option><option value="34">Maximum damage</option><option value="36">Speed</option><option value="134">Melee DPS</option><option value="135">Melee minimum damage</option><option value="136">Melee maximum damage</option><option value="137">Melee speed</option><option value="138">Ranged DPS</option><option value="139">Ranged minimum damage</option><option value="140">Ranged maximum damage</option><option value="141">Ranged speed</option></optgroup><optgroup label="Resistances"><option value="25">Arcane resistance</option><option value="26">Fire resistance</option><option value="28">Frost resistance</option><option value="30">Holy resistance</option><option value="27">Nature resistance</option><option value="29">Shadow resistance</option></optgroup><optgroup label="Source"><option value="86">Crafted by a profession</option><option value="16">Drops in...</option><option value="105">Drops in Normal mode... (Dungeon)</option><option value="106">Drops in Heroic mode... (Dungeon)</option><option value="147">Drops in Normal 10 mode... (Raid)</option><option value="148">Drops in Normal 25 mode... (Raid)</option><option value="149">Drops in Heroic 10 mode... (Raid)</option><option value="150">Drops in Heroic 25 mode... (Raid)</option><option value="68">Obtained through disenchanting</option><option value="69">Obtained through fishing</option><option value="70">Obtained through herb gathering</option><option value="71">Obtained through item opening</option><option value="72">Obtained through looting</option><option value="143">Obtained through milling</option><option value="73">Obtained through mining</option><option value="74">Obtained through object opening</option><option value="75">Obtained through pick pocketing</option><option value="88">Obtained through prospecting</option><option value="93">Obtained through PvP</option><option value="171">Obtained through redemption</option><option value="76">Obtained through skinning</option><option value="158">Purchasable with a currency...</option><option value="118">Purchasable with an item...</option><option value="18">Rewarded by a quest</option><option value="126">Rewarded by a quest in...</option><option value="172">Rewarded by an achievement</option><option value="92">Sold by a vendor</option><option value="129">Sold by NPC #...</option><option value="128">Source</option></optgroup><optgroup label="Miscellaneous"><option value="109">Additional armor</option><option value="161">Available to players</option><option value="90">Average buyout price</option><option value="65">Average money contained</option><option value="9">Conjured item</option><option value="62">Cooldown (seconds)</option><option value="162">Deprecated</option><option value="8">Disenchantable</option><option value="163">Disenchants into...</option><option value="59">Durability</option><option value="104">Flavor text</option><option value="7">Has a flavor text</option><option value="10">Locked</option><option value="159">Millable</option><option value="85">Objective of a quest</option><option value="11">Openable</option><option value="12">Part of an item set</option><option value="98">Party loot</option><option value="89">Prospectable</option><option value="5">Quest item</option><option value="13">Randomly enchanted</option><option value="14">Readable</option><option value="87">Reagent for ability/profession</option><option value="154">Refundable</option><option value="64">Sale price (coppers)</option><option value="157">Smart loot</option><option value="6">Starts a quest</option><option value="91">Tool</option><option value="155">Usable in arenas</option><option value="156">Usable when shapeshifted</option></optgroup><optgroup label="Community"><option value="130">Has comments</option><option value="113">Has screenshots</option><option value="167">Has videos</option></optgroup></select></div></div><div><a href="javascript:;" id="fi_addcriteria" onclick="fi_addCriterion(this); return false">Add another filter</a></div>

<div class="padded">Match: <input type="radio" name="ma" value="" id="ma-0" checked="checked"><label for="ma-0">All filters</label><input type="radio" name="ma" value="1" id="ma-1"><label for="ma-1">At least one</label>

</div>

<div class="padded">Group by:<input type="radio" name="gb" value="" id="gb-none" checked="checked"><label for="gb-none">None</label><input type="radio" name="gb" value="1" id="gb-slot"><label for="gb-slot">Slot</label><input type="radio" name="gb" value="2" id="gb-level"><label for="gb-level">Level</label><input type="radio" name="gb" value="3" id="gb-source"><label for="gb-source">Source</label></div><div class="clear"></div>*}

<div class="padded"></div><input id="apply" type="submit" value="Apply filter"> <input type="button" value="Remove filter" onclick="location = 'http://' + window.location.hostname + window.location.search.split('&')[0]">
<div class="clear"></div>
<input type="hidden" name="upg">

<div class="pad"></div>

</form></div>