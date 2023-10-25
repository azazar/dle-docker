# DataLife Engine Docker Image

This is a Docker image for the trial version of DataLife Engine.

## Description

This Docker image allows you to quickly set up a trial version of DataLife Engine, a popular content management system.

## Usage

To use this Docker image, run the following command:

```bash
docker run -p 80:80 azazar/dle:trial
```

Then, open your web browser and navigate to `http://localhost` to start the DataLife Engine installation process.

## Building

To build this Docker image, run the following command:

```bash
docker build . -t azazar/dle:trial
```

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/azazar/dle-docker/blob/main/LICENSE) file for details.
