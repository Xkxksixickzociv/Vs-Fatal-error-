local xx = 300;
local yy = 75;
local xx2 = 820;
local yy2 = 450;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;
local beating = false;
local beat_skip = 0;
local dadZoom = 0.5;
local bfZoom = 0.65;

function onCreatePost()--this thing happens once the characters are spawned

    setProperty("gf.visible", false);

end

function onCreate()
	--background boi
	makeLuaSprite('flashwhite','flashwhite', 0, 0)
	makeLuaSprite('scenema','cutscene', 0, 0)
	makeLuaSprite('Back','Fatal/Back', -3500, -2000)
    
    makeLuaSprite('ground','Fatal/floor', -3500, -200)
	makeLuaSprite('ground-3','Floor3', -3500, -1400)
    
	makeAnimatedLuaSprite('Glitch','Fatal/Glitch', -3500, -1550)
	addAnimationByPrefix('Glitch','Glitch stand','Glitch stand',24,true)
    objectPlayAnimation('Glitch','dance',false);
	
	makeAnimatedLuaSprite('error','Fatal/error', 100, -400)
	addAnimationByPrefix('error','Error stand','Error stand',25,true)
    objectPlayAnimation('error','Error stand',false);
	
	makeAnimatedLuaSprite('error2','Fatal/error', -300, -800)
	addAnimationByPrefix('error2','Error stand','Error stand',25,true)
    objectPlayAnimation('error2','Error stand',false);
	
	makeAnimatedLuaSprite('error3','Fatal/error', 1200, -500)
	addAnimationByPrefix('error3','Error stand','Error stand',25,true)
    objectPlayAnimation('error3','Error stand',false);
	
    makeAnimatedLuaSprite('puppets','Fatal/puppets', -300, -150)
	addAnimationByPrefix('puppets','loop','characters',24,true)
    objectPlayAnimation('puppets','loop',false);
	scaleObject('puppets', 0.65, 0.65);
	
	makeLuaSprite('ground-2','Floor', -1500, -1500)
	makeLuaSprite('Machine-2','Machine', -1500, -1500)
	setScrollFactor('Machine-2', 0.5, 0.5);
	makeLuaSprite('mountain-2','mountain', -1500, -1500)
	setScrollFactor('mountain-2', 0.5, 0.5);
	makeLuaSprite('sea-2','sea', -1500, -1500)
	setScrollFactor('sea-2', 0.5, 0.5);
	makeLuaSprite('sky-2','sky', -1500, -1500)
	setScrollFactor('sky-2', 0.5, 0.5);
	
	makeLuaSprite('Screen1','Screen1', 1500, 200)
	makeLuaSprite('Screen2','Screen2', 1700, -300)
	makeLuaSprite('Screen3','Screen3', 100, -400)
	


    addLuaSprite('Back')
	addLuaSprite('ground')
	addLuaSprite('ground-3', false)
	addLuaSprite('Glitch', false)
	addLuaSprite('error', false)
	addLuaSprite('error2', false)
	addLuaSprite('error3', false)
	addLuaSprite('puppets', false)
	
	
	addLuaSprite('sky-2')
	addLuaSprite('sea-2')
	addLuaSprite('mountain-2')
	addLuaSprite('Machine-2')
	addLuaSprite('ground-2')
	
	addLuaSprite('flash')
	addLuaSprite('flashwhite')
	addLuaSprite('scenema')
	
	addLuaSprite('Screen1', false)
	addLuaSprite('Screen2', false)
	addLuaSprite('Screen3', false)


	setProperty('flash.alpha', 0);
	setObjectCamera('flash', 'other');
	setProperty('flashwhite.alpha', 0);
	setObjectCamera('flashwhite', 'other');
	setProperty('scenema.alpha', 0);
	setObjectCamera('scenema', 'other');
	
	setProperty('Back.visible', false);
	setProperty('ground.visible', false);
	setProperty('Glitch.visible', false);
	setProperty('error.visible', false);
	setProperty('error2.visible', false);
	setProperty('error3.visible', false);
	setProperty('puppets.visible', false);
	setProperty('Screen1.visible', false);
	setProperty('Screen2.visible', false);
	setProperty('Screen3.visible', false);
	setProperty('ground-3.visible', false);
	
end

function stage2()
    flashdark();
	setProperty('Back.visible', true);
	setProperty('ground.visible', true);
	setProperty('Glitch.visible', true);
	setProperty('error.visible', true);
	setProperty('error2.visible', true);
	setProperty('error3.visible', true);
	setProperty('puppets.visible', true);
	
	setProperty('ground-2.visible', false);
	setProperty('mountain-2.visible', false);
	setProperty('Machine-2.visible', false);
	setProperty('sky-2.visible', false);
	setProperty('sea-2.visible', false);
	end
	
function stage3()
    flashdark();
    setProperty('Back.visible', true);
	setProperty('ground-3.visible', true);
	setProperty('ground.visible', false);
	setProperty('Glitch.visible', false);
	setProperty('error.visible', false);
	setProperty('error2.visible', false);
	setProperty('error3.visible', false);
	setProperty('puppets.visible', false);
	
	setProperty('ground-2.visible', false);
	setProperty('mountain-2.visible', false);
	setProperty('Machine-2.visible', false);
	setProperty('sky-2.visible', false);
	setProperty('sea-2.visible', false);
	
	setProperty('Screen1.visible', true);
	setProperty('Screen2.visible', true);
	setProperty('Screen3.visible', true);
	
	triggerEvent('Change Character', 1, 'fatal-true');
	triggerEvent('Change Character', 0, 'bf-back');
	
	setCharacterX('dad', 750.6);
    setCharacterY('dad', -200);
	setCharacterX('bf', 1150);
    setCharacterY('bf', 120);
	xx = 1200;
    yy = 50;
	xx2 = 1200;
    yy2 = 350;
	end
	

function onBeatHit()
    objectPlayAnimation('error','Error stand',false);
	objectPlayAnimation('error2','Error stand',false);
	objectPlayAnimation('error3','Error stand',false);
	objectPlayAnimation('puppets','loop',false);
    if beat_skip == 0 then
	    beat_skip = 1
        if beating == true then
	        triggerEvent('Add Camera Zoom', 0.06, 0.04)
		end
	else
	    beat_skip = 0
	    
end
end


function flash()
    setProperty('flashwhite.alpha', 1);
	doTweenAlpha('flashdown', 'flashwhite', 0, 0.5, 'linear');
end
function flashdark()
    setProperty('flash.alpha', 1);
	doTweenAlpha('flashdown2', 'flash', 0, 0.5, 'linear');
end

function onStepHit()
	    if curStep == 256 then
		beating = true;
		stage2();
		end
		if curStep == 512 then
		beating = false;
		end
		if curStep == 896 or curStep == 1856 then
		beating = true;
		end
		if curStep == 1152 then
		triggerEvent('Change Character', 1, 'fatal_glitch');
		beating = false;
		end
		if curStep == 1984 then
		stage3();
		end
    end

function onUpdate(elapsed)

    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',dadZoom)

            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            setProperty('defaultCamZoom',bfZoom)

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end


function opponentNoteHit()
	
    health = getProperty('health')
        if getProperty('health') > 0.4 then
            setProperty('health', health- 0.02);
		end
    end