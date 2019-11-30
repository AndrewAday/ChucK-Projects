MidiOut mout;
MidiMsg msg;
Util util;

[
  "",
  "----------------------",
  "--------------------------------------------",
  "------------------------------------------------------------------",
  "----------------------------------------------------------------------------------------",
  "--------------------------------------------------------------------------------------------------------------",
  "------------------------------------------------------------------------------------------------------------------------------------",
  "----------------------------------------------------------------------------------------------------------------------------------------------------------",
  "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------",
  "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------",
  "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------",
  "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------",
  "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------",
  "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------",
  "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------",
  "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
]  @=> string prefixes[];

if (!me.args()) {
  <<< "usage: chuck in_c.ck:<midi_port>:<num_players>" >>>;
  me.exit();
}

util.str_to_int[me.arg(0)] => int midi_port;
if (!mout.open(midi_port)) {
  me.exit();
} else {
  <<< "connected to midi port " + me.arg(0) >>>;
}

/*
Duration is counted in 32nd note beats
*/

util.str_to_int[me.arg(1)] => int num_players => int num_still_playing;  // max 15, for 16 midi channels - 1 pulse
1 => int pulsing;
112 => float bpm;
(60. / (8.*bpm))::second => dur beat;  // seconds per 32nd note
4::beat => dur pulse_dur;  // 8th note pulse
.9 => float repeat_prob;

[
  [ // [midi note, duration]
    [60, 1],[64, 7],[60, 1],[64, 7],[60, 1],[64, 7]
  ],
  [
    [60, 1],[64, 3],[65, 4],[64, 8]
  ],
  [
    [-1, 4],[64, 4],[65, 4],[64, 4]
  ],
  [
    [-1, 4],[64, 4],[65, 4],[67, 4]
  ],
  [
    [64, 4],[65, 4],[67, 4],[-1, 4]
  ],
  [
    [72, 64]
  ],
  [
    [-1, 28],[60, 4],[60, 4],[60, 4],[-1, 36]
  ],
  [
    [67, 48],[65, 64]
  ],
  [
    [71, 2],[67, 2],[-1, 28]
  ],
  [
    [71, 2],[67, 2]
  ],
  [  // m.11
    [65, 2],[67, 2],[71, 2],[67, 2],[71, 2],[67, 2]
  ],
  [
    [65, 4],[67, 4],[71, 32],[72, 8]
  ],
  [
    [71, 2],[67, 6],[67, 2],[65, 2],[67, 4],[-1, 6],[67, 26]
  ],
  [
    [72, 32],[71, 32],[67, 32],[66, 32]
  ],
  [ // m.15
    [67, 2], [-1, 30]
  ],
  [
    [67, 2],[71, 2],[72, 2],[71, 2]
  ],
  [
    [71, 2],[72, 2],[71, 2],[72, 2],[71, 2],[-1, 2]
  ],
  [
    [64, 2],[66, 2],[64, 2],[66, 2],[64, 6],[64, 2]
  ],
  [
    [-1, 12],[67, 12]
  ],
  [
    [64, 2],[66, 2],[64, 2],[66, 2],[55, 6],[64, 2],[66, 2],[64, 2],[66, 2],[64, 2]
  ],
  [  // m.21
    [66, 24]
  ],
  [
    [64, 4],[64, 4],[64, 4],[64, 4],[64, 4],[64, 4],[64, 4],[64, 4],[64, 4],[64, 4],[64, 4],[64, 4],[64, 4],[64, 4],[64, 4],[66, 4],[66, 4],[66, 4],[67, 4],[67, 4],[67, 4],[69, 4],[69, 4],[69, 4],[71, 4]
  ],
  [
    [64,4],[66,4],[66,4],[66,4],[66,4],[66,4],[66,4],[66,4],[66,4],[66,4],[66,4],[66,4],[66,4],[66,4],[66,4],[66,4],[67,4],[67,4],[67,4],[69,4],[69,4],[69,4],[71,8]
  ],
  [  // m.24
    [64, 4],[66, 4],[67, 4],[67, 4],[67, 4],[67, 4],[67, 4],[67, 4],[67, 4],[67, 4],[67, 4],[67, 4],[67, 4],[67, 4],[67, 4],[67, 4],[67, 4],[69, 4],[69, 4],[69, 4],[71, 4]
  ],
  [
    [64, 4],[66, 4],[67, 4],[69, 4],[69, 4],[69, 4],[69, 4],[69, 4],[69, 4],[69, 4],[69, 4],[69, 4],[69, 4],[69, 4],[69, 4],[69, 4],[69, 4],[69, 4],[71, 4],[71, 4],[71, 4]
  ],
  [
    [64, 4],[66, 4],[67, 4],[69, 4],[71, 4],[71, 4],[71, 4],[71, 4],[71, 4],[71, 4],[71, 4],[71, 4],[71, 4],[71, 4],[71, 4],[71, 4],[71, 4],[71, 4],[71, 4]
  ],
  [  // m.27
    [64, 2],[66, 2],[64, 2],[66, 2],[67, 4],[64, 2],[67, 2],[66, 2],[64, 2],[66, 2],[64, 2]
  ],
  [
    [64, 2],[66, 2],[64, 2],[66, 2],[64, 6],[64, 2]
  ],
  [
    [64, 24],[67, 24],[72, 24]
  ],
  [
    [72, 48]
  ],
  [
    [67, 2],[65, 2],[67, 2],[71, 2],[67, 2],[71, 2]
  ],
  [
    [65, 2],[67, 2],[65, 2],[67, 2],[71, 2],[65, 26],[67, 12]
  ],
  [
    [67, 2],[65, 2],[-1, 2]
  ],
  [
    [67, 2],[65, 2]
  ],
  [  // m.35
    [65, 2],[67, 2],[71, 2],[67, 2],[71, 2],[67, 2],[71, 2],[67, 2],[71, 2],[67, 2],[-1, 28],[70, 8],[79, 24],[81, 4],[79, 8],[83, 4],[81, 12],[79, 4],[76, 24],[79, 4],[78, 28],[-1, 20],[76, 20],[77, 32]
  ],
  [
    [65, 2],[67, 2],[71, 2],[67, 2],[71, 2],[67, 2]
  ],
  [
    [65, 2],[67, 2]
  ],
  [
    [65, 2],[67, 2],[71, 2]
  ],
  [
    [71, 2],[67, 2],[65, 2],[67, 2],[71, 2],[72, 2]
  ],
  [
    [71, 2],[65, 2]
  ],
  [  // m.41
    [71, 2],[67, 2]
  ],
  [
    [72, 32],[71, 32],[69, 32],[72, 32]
  ],
  [
    [65, 2],[64, 2],[65, 2],[64, 2],[64, 4],[64, 4],[64, 4],[65, 2],[64, 2]
  ],
  [
    [77, 4],[76, 8],[76, 4],[72, 8]
  ],
  [
    [74, 8],[74, 8],[67, 8]
  ],
  [
    [67, 2],[74, 2],[76, 2],[74, 2],[-1, 4],[67, 4],[-1, 4],[67, 4],[-1, 4],[67, 4],[67, 2],[74, 2],[76, 2],[74, 2]
  ],
  [
    [74, 2],[76, 2],[74, 4]
  ],
  [  // m.48
    [67, 48],[67, 32],[65, 40]
  ],
  [
    [65, 2],[67, 2],[70, 2],[67, 2],[70, 2],[67, 2]
  ],
  [
    [65, 2],[67, 2]
  ],
  [
    [65, 2],[67, 2],[70, 2]
  ],
  [
    [67, 2],[70, 2]
  ],
  [
    [70, 2],[67, 2]
  ]
] @=> int PHRASES[][][];


fun void play(int midi_channel, float repeat_prob, int octave) {
  for (0 => int i; i < PHRASES.cap(); i++) {
    PHRASES[i] @=> int phrase[][];
    <<< prefixes[midi_channel-1], midi_channel, ": playing phrase ", i+1 >>>;
    do {
      for (0 => int j; j < phrase.cap(); j++) {
        phrase[j][0] => int midi_note;
        if (midi_note >= 0) {
          phrase[j][0] + (12*octave) => int transposed_midi;
          mout.send(util.getMidiNoteOn(midi_channel, transposed_midi, 100));
          phrase[j][1]::beat => now;
          mout.send(util.getMidiNoteOff(midi_channel, midi_note));
        } else {
          phrase[j][1]::beat => now;
        }
      }
    } while (Math.randomf() < repeat_prob);
  }
  num_still_playing--;
}

fun void sendPulse() {
  mout.send(util.getMidiNoteOn(16, 84, 100));
  pulse_dur => now;
  mout.send(util.getMidiNoteOff(16, 84));
}

fun void pulse() {
  10 => int num_end_pulses;
  do {
    sendPulse();
    /* <<< "num_still_playing", num_still_playing >>>; */
  } while (num_still_playing);
  while (num_end_pulses) {
    sendPulse();
    num_end_pulses--;
  }
  0 => pulsing;
}

fun void startPlaying() {
  for (1 => int i; i <= num_players; i++) {
    spork ~ play(i, repeat_prob, 0);
  }
}

spork ~ pulse();
10::pulse_dur => now;
startPlaying();

do {
  1::second => now;
} while (pulsing);

// TODO: weight repetition probability by duration of measure
// TODO: make this into a public class, in_c_conductor and enable playing via ChucK OTF programming
// TODO: add "max_phrase" static variable and enforce that all players are within max_phrase_distance
// amount of each other