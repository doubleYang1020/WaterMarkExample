#ifdef GL_ES
precision highp float;
#endif


varying highp vec2 textureCoordinate;
varying highp vec2 textureCoordinate2;

uniform sampler2D inputImageTexture;
uniform sampler2D inputImageTexture2;


void main() {
  vec2 st = textureCoordinate;
  vec4 image = texture2D(inputImageTexture, st);
  
  vec2 uv = textureCoordinate2;
  vec4 overlay = texture2D(inputImageTexture2, st);
  
  vec4 fragColor = vec4(image.rgb * (1.0 - overlay.a) + overlay.rgb, 1.0);

  
  gl_FragColor = fragColor;
}

