set -m

# Creating directories for models
mkdir my_model
mkdir my_tokenizer

# Downloading a model and saving it to created directories
python model.py &&

cd .. 

# Archiving our model into .mar file
torch-model-archiver --model-name BERTweetSentimentAnalysis --version 1.0 --model-file app/my_model/model.safetensors --handler app/handler.py --extra-files "app/my_model/config.json,app/my_tokenizer/added_tokens.json,app/my_tokenizer/bpe.codes,app/my_tokenizer/special_tokens_map.json,app/my_tokenizer/tokenizer_config.json,app/my_tokenizer/vocab.txt,app/index_to_name.json" --export-path home/model-server/model-store

# CORS - workaround, adding every host to CORS, vulnerable, change to nginx in production
cd home/model-server

# Changing config for CORS
echo "cors_allowed_origin=*" >> config.properties
echo "cors_allowed_methods=GET, POST, PUT, OPTIONS" >> config.properties
echo "cors_allowed_headers=X-Custom-Header, Origin, X-Requested-With, Content-Type, Accept" >> config.properties